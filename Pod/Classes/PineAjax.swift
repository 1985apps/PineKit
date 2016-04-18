//
//  PineAjax.swift
//  Pods
//
//  Created by Prakash Raman on 18/04/16.
//
//

import UIKit
import SwiftyJSON
import Alamofire

public class PineAjax: NSObject {
    
    public static var baseUrl = "http://"
    
    public var request: Request?
    public var url : String = ""
    public var _parameters : Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()
    public var method = Alamofire.Method.GET
    public var _files : [Dictionary<String, AnyObject>] = []
    
    private var successCallback : (json: JSON, response: Response<AnyObject, NSError>) -> Void = {_ in }
    private var errorCallback : (json: JSON, response: Response<AnyObject, NSError>) -> Void = {_ in }
    
    public init(method: Alamofire.Method = .GET, url: String){
        self.url = url
        self.method = method
    }
    
    public func params(params: Dictionary<String, AnyObject>) -> PineAjax {
        self._parameters = params
        return self
    }
    
    public func file(name: String, data: NSData, fileName: String, mimeType: String = "image/jpg") -> PineAjax {
        let item = ["name": name, "data": data, "fileName": fileName, "mimeType": mimeType]
        self._files.append(item)
        return self
    }
    
    public func run() -> PineAjax {
        print("Running the Ajax: params: \(self._parameters)")
        return self._files.count > 0 ? runUpload() : runRequest()
    }
    
    public func runRequest() -> PineAjax {
        let url = PineAjax.baseUrl + self.url
        var headers : Dictionary <String, String> = Dictionary<String, String>()
        if let token = PineSimpleData.getString("token") {
            headers["token"] = token
            print("Token: \(token)")
        }
        self.request = Alamofire.request(self.method, url, parameters: self._parameters, headers: headers)
            .responseJSON(completionHandler: self.onResponse)
        
        return self
    }
    
    public func runUpload() -> PineAjax {
        let url = PineAjax.baseUrl + self.url
        var headers : Dictionary <String, String> = Dictionary<String, String>()
        if let token = PineSimpleData.getString("token") {
            headers["token"] = token
            print("Token: \(token)")
        }
        
        Alamofire.upload(
            .POST,
            url,
            headers: headers,
            multipartFormData: { multipartFormData in
                for (file) in self._files {
                    multipartFormData.appendBodyPart(data: (file["data"] as! NSData), name: (file["name"] as! String), fileName: (file["fileName"] as! String), mimeType: (file["mimeType"] as! String))
                }
                for (key, value) in self._parameters {
                    multipartFormData.appendBodyPart(data: String(value).dataUsingEncoding(NSUTF8StringEncoding)!, name: key)
                }
            },
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .Success(let upload, _, _):
                    upload.responseJSON { response in
                        let json = JSON(rawValue: response.result.value!)
                        let code = response.response?.statusCode
                        if code >= 200 && code <= 300 {
                            self.successCallback(json: json!, response: response)
                        } else {
                            self.errorCallback(json: json!, response: response)
                        }
                    }
                case .Failure(let encodingError):
                    print(encodingError)
                }
            }
        )
        return self
    }
    
    public func onResponse(response: Response<AnyObject, NSError>) -> Void {
        let json = JSON(rawValue: response.result.value!)
        let code = response.response?.statusCode
        if code >= 200 && code <= 300 {
            self.successCallback(json: json!, response: response)
        } else {
            self.errorCallback(json: json!, response: response)
        }
    }
    
    public func success(callback: (json: JSON, response: Response<AnyObject, NSError>) -> Void) -> PineAjax {
        self.successCallback = callback
        return self
    }
    
    public func error(callback: (json: JSON, response: Response<AnyObject, NSError>) -> Void ) -> PineAjax {
        self.errorCallback = callback
        return self
    }
    
    
}

