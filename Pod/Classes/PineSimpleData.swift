//
//  PineSimpleData.swift
//  Pods
//
//  Created by Prakash Raman on 25/02/16.
//
//

import UIKit
import Foundation
import SwiftyJSON

/**
    An easy-to-use wrapper convenience class to NSCoding. It's primary usage is as a key - value pair peristent (NSCoding) data storage. 
 
    Could be used to hold session variables, etc.
 
        // To set a value
        PineSimpleData.update("tvshow", "LOST")
 
        // To retrieve a value
        PineSimpleData.get("tvshow") // RETURNS: "LOST"
 
        // To remove a value
        PineSimpleData.remove("tvshow")
*/
open class PineSimpleData: NSObject, NSCoding {

    /// The Dictionary<String, AnyObject>  instance variable that holds the key-value pairs.
    open var data: Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("PineSimpleData")
    
    init(data: Dictionary<String, AnyObject>) {
        super.init()
        self.data = data
    }
    
    open func encode(with aCoder: NSCoder) {
        aCoder.encode(self.data, forKey: "raw")
    }
    
    required convenience public init(coder aDecoder: NSCoder){
        var data = Dictionary<String, AnyObject>()
        if (aDecoder.decodeObject(forKey: "raw") != nil) {
            data = (aDecoder.decodeObject(forKey: "raw") as! Dictionary<String, AnyObject>)
        }
        self.init(data: data)
    }
    
    func save(){
        NSKeyedArchiver.archiveRootObject(self, toFile: PineSimpleData.ArchiveURL.path)
    }
    
    
    static func getSingle() -> PineSimpleData {
        let item = NSKeyedUnarchiver.unarchiveObject(withFile: PineSimpleData.ArchiveURL.path) as? PineSimpleData
        if (item != nil) {
            return item!
        }
        return PineSimpleData(data: Dictionary<String, AnyObject>())
    }
    
    /**
    Set / update a value of the data storage

    - parameter key: String
    - parameter value: AnyObject
    */
    open static func update(_ key: String, value: AnyObject?){
        let single = getSingle()
        single.data[key] = value
        single.save()
    }
    
    /**
    Retrieves the value associated to the key

    - parameter key: String

    - returns: AnyObject
     
     */
    open static func get(_ key: String) -> AnyObject? {
        return getSingle().data[key]
    }
    
    /**
     Retrieves the type-casted String value associated to the key
     
     - parameter key: String
     
     - returns: AnyObject
     
     */
    open static func getString(_ key: String) -> String? {
        return get(key) as? String
    }
    
    /** 
    Retrives type-casted Int of the value associated to the key

    - parameter key: String

    - returns: Int
    */
    open static func getInt(_ key: String) -> Int? {
        return get(key) as? Int
    }
    
    /**
    Returns the data dictionary holding the entire key-value pair

    - returns: Dictionary<String, AnyObject>
    */
    open static func getFull() -> Dictionary<String, AnyObject> {
        return getSingle().data
    }
    
    open static func getJSON(_ key: String) -> JSON {
        return JSON(get(key)!)
    }
    
    open static func remove(_ key: String){
        let single = getSingle()
        single.data.removeValue(forKey: key)
        single.save()
    }
    
    open static func removeKeys(_ keys: [String]){
        for key in keys {
            remove(key)
        }
    }
    
    open static func clear(){
        let single = getSingle()
        single.data.removeAll()
        single.save()
    }
    
}
