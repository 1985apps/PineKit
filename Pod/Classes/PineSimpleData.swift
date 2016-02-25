//
//  PineSimpleData.swift
//  Pods
//
//  Created by Prakash Raman on 25/02/16.
//
//

import UIKit
import Foundation

public class PineSimpleData: NSObject, NSCoding {

    public var data: Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()
    
    public static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    public static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("PineSimpleData")
    
    public init(data: Dictionary<String, AnyObject>) {
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
    
    public func save(){
        NSKeyedArchiver.archiveRootObject(self, toFile: PineSimpleData.ArchiveURL.path!)
    }
    
    /* STATIC METHODS */
    
    public static func getSingle() -> PineSimpleData {
        let item = NSKeyedUnarchiver.unarchiveObjectWithFile(PineSimpleData.ArchiveURL.path!) as? PineSimpleData
        if (item != nil) {
            return item!
        }
        return PineSimpleData(data: Dictionary<String, AnyObject>())
    }
    
    public static func update(key: String, value: AnyObject?){
        let single = getSingle()
        single.data[key] = value
        single.save()
    }
    
    public static func get(key: String) -> AnyObject? {
        return getSingle().data[key]
    }
    
    public static func getString(key: String) -> String? {
        return get(key) as? String
    }
    
    public static func getInt(key: String) -> Int? {
        return get(key) as? Int
    }
    
    public static func getFull() -> Dictionary<String, AnyObject> {
        return getSingle().data
    }
    
    public static func remove(key: String){
        let single = getSingle()
        single.data.removeValueForKey(key)
        single.save()
    }
    
}
