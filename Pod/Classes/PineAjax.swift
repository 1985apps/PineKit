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

/*open class PineAjax: NSObject {
    
    open static var baseUrl = "http://"
    open var headers : Dictionary <String, String> = Dictionary<String, String>()
    
    open var request: Request?
    open var url : String = ""
    open var _parameters : Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()
    open var method = Alamofire.Method.GET
    open var _files : [Dictionary<String, AnyObject>] = []
    
    fileprivate var successCallback : (_ json: JSON, _ response: Response<AnyObject, NSError>) -> Void = {_ in }
    fileprivate var errorCallback : (_ json: JSON, _ response: Response<AnyObject, NSError>) -> Void = {_ in }
    
    public init(method: Alamofire.Method = .GET, url: String){
        self.url = url
        self.method = method
    }
    
    open func params(_ params: Dictionary<String, AnyObject>) -> PineAjax {
        self._parameters = params
        return self
    }
    
    open func file(_ name: String, data: Data, fileName: String, mimeType: String = "image/jpg") -> PineAjax {
        let item = ["name": name, "data": data, "fileName": fileName, "mimeType": mimeType] as [String : Any]
        self._files.append(item as [String : AnyObject])
        return self
    }
    
    open func run() -> PineAjax {
        print("Running the Ajax: params: \(self._parameters)")
        return self._files.count > 0 ? runUpload() : runRequest()
    }
    
    open func runRequest() -> PineAjax {
        let url = PineAjax.baseUrl + self.url
        if let token = PineSimpleData.getString("token") {
            headers["token"] = token
            print("Token: \(token)")
        }
        self.request = Alamofire.request(self.method, url, parameters: self._parameters, headers: headers)
            .responseJSON(completionHandler: self.onResponse)
        
        return self
    }
    
    open func runUpload() -> PineAjax {
        let url = PineAjax.baseUrl + self.url
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
    
    open func onResponse(_ response: Response<AnyObject, NSError>) -> Void {
        var json = JSON(rawValue: "{}")
        if response.result.value != nil {
            json = JSON(rawValue: response.result.value!)
        }
        let code = response.response?.statusCode
        if code >= 200 && code <= 300 {
            self.successCallback(json: json!, response: response)
        } else {
            self.errorCallback(json: json!, response: response)
        }
    }
    
    open func success(_ callback: (_ json: JSON, _ response: Response<AnyObject, NSError>) -> Void) -> PineAjax {
        self.successCallback = callback
        return self
    }
    
    open func error(_ callback: (_ json: JSON, _ response: Response<AnyObject, NSError>) -> Void ) -> PineAjax {
        self.errorCallback = callback
        return self
    }
    
    
}

*/
