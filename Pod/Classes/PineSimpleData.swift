//
//  PineSimpleData.swift
//  Pods
//
//  Created by Prakash Raman on 25/02/16.
//
//

import UIKit
import Foundation

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
public class PineSimpleData: NSObject, NSCoding {

    /// The Dictionary<String, AnyObject>  instance variable that holds the key-value pairs.
    public var data: Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("PineSimpleData")
    
    init(data: Dictionary<String, AnyObject>) {
        super.init()
        self.data = data
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.data, forKey: "raw")
    }
    
    required convenience public init(coder aDecoder: NSCoder){
        var data = Dictionary<String, AnyObject>()
        if (aDecoder.decodeObjectForKey("raw") != nil) {
            data = (aDecoder.decodeObjectForKey("raw") as! Dictionary<String, AnyObject>)
        }
        self.init(data: data)
    }
    
    func save(){
        NSKeyedArchiver.archiveRootObject(self, toFile: PineSimpleData.ArchiveURL.path!)
    }
    
    
    static func getSingle() -> PineSimpleData {
        let item = NSKeyedUnarchiver.unarchiveObjectWithFile(PineSimpleData.ArchiveURL.path!) as? PineSimpleData
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
    public static func update(key: String, value: AnyObject?){
        let single = getSingle()
        single.data[key] = value
        single.save()
    }
    
    /**
    Retrieves the value associated to the key

    - parameter key: String

    - returns: AnyObject
     
     */
    public static func get(key: String) -> AnyObject? {
        return getSingle().data[key]
    }
    
    /**
     Retrieves the type-casted String value associated to the key
     
     - parameter key: String
     
     - returns: AnyObject
     
     */
    public static func getString(key: String) -> String? {
        return get(key) as? String
    }
    
    /** 
    Retrives type-casted Int of the value associated to the key

    - parameter key: String

    - returns: Int
    */
    public static func getInt(key: String) -> Int? {
        return get(key) as? Int
    }
    
    /**
    Returns the data dictionary holding the entire key-value pair

    - returns: Dictionary<String, AnyObject>
    */
    public static func getFull() -> Dictionary<String, AnyObject> {
        return getSingle().data
    }
    
    public static func getJSON(key: String) -> JSON {
        return JSON(get(key)!)
    }
    
    public static func remove(key: String){
        let single = getSingle()
        single.data.removeValueForKey(key)
        single.save()
    }
    
}
