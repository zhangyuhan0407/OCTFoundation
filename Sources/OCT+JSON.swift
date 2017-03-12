

import Foundation
import OCTJSON


extension JSON {
    
    static func read(fromFile file: String) -> JSON? {
        
        guard let data = FileManager.default.contents(atPath: file) else {
            return nil
        }
        
        guard let s = String(data: data, encoding: String.Encoding.utf8) else {
            return nil
        }
        
        do {
            let json = try JSON.deserialize(s)
            return json
        } catch {
            return nil
        }
        
    }
    
    
    mutating func update(value: Any, forKey key: String) {
        self[key] = JSON(value)
    }
    
    mutating func add(value: Int, forKey key: String) {
        let count = self[key].int ?? 0
        self[key] = JSON(count + value)
    }
    
    
}
