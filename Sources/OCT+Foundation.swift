


#if os(Linux)
    import Glibc
#else
    import Darwin
#endif



extension Int {
    
    static func random(max: Int = 100) -> Int {
        #if os(Linux)
            return Int(Glibc.random() % max)
        #else
            return Int(arc4random() % UInt32(max))
        #endif
    }
    
    
    func toPercentage() -> Float {
        return Float(self)/Float(100)
    }
    
    func multiply(_ factor: Float) -> Int {
        return Int(Float(self) * factor)
    }
    
    
}



enum OCTError: Swift.Error {
    case fileNotExist
    case dataConvert
    case jsonConvert
    case noMaterial
    case database
    case badInput
}



extension String {
    
    func write(toFile file: String, atomically: Bool, inAppendMode: Bool) throws {
        
        let file = file.expandingTildeInPath()
        
        if !FileManager.default.fileExists(atPath: file) || !inAppendMode {
            try self.write(toFile: file, atomically: atomically, encoding: String.Encoding.utf8)
            return
        }
        
        guard let fileHandle = FileHandle(forWritingAtPath: file)  else {
            throw OCTError.fileNotExist
        }
        
        
        fileHandle.truncateFile(atOffset: fileHandle.seekToEndOfFile())
        
        guard let data = self.data(using: String.Encoding.utf8) else {
            throw OCTError.dataConvert
        }
        
        fileHandle.write(data)
        
    }
    
    
    static func read(fromFile file: String) -> String? {
        guard let data = FileManager.default.contents(atPath: file) else {
            return nil
        }
        
        guard let s = String(data: data, encoding: String.Encoding.utf8) else {
            return nil
        }
        
        return s
    }
    
    
    func expandingTildeInPath() -> String {
        if self.hasPrefix("~") {
            let home = NSHomeDirectory()
            let s = self.replacingOccurrences(of: "~", with: home)
            return s
            
        }
        return self
    }
    
    
}


func +(dict1: [String: Any], dict2: [String: Any]) -> [String: Any] {
    var ret = dict1
    for key in dict2.keys {
        ret.updateValue(dict2[key], forKey: key)
    }
    return ret
}
