

import Foundation


#if os(Linux)
let LogDirPath = "~/Logs/".expandingTildeInPath()
#else
let LogDirPath = "/Users/yorg/Developer/MechanMon/Logs/".expandingTildeInPath()
#endif

let SaveToFile = true
let DebugMode = true



public class Logger {
    
    private init() {}
    
    private static var DEBUG_BUF = [String]()
    private static var ERROR_BUF = [String]()
    
    
    private class func appendDEBUG(_ s: String) {
        DEBUG_BUF.append(s)
        if DEBUG_BUF.count > 100 {
            let debug = DEBUG_BUF.joined(separator: "\n\n")
            let filePath = LogDirPath + Logger.localTime().components(separatedBy: " ")[0]
            
            do {
                try debug.write(toFile: filePath, atomically: true, inAppendMode: true)
                DEBUG_BUF = []
            } catch {
                
            }
        }
    }
    
    
    private class func appendERROR(_ s: String) {
        ERROR_BUF.append(s)
        if ERROR_BUF.count > 100 {
            let error = DEBUG_BUF.joined(separator: "\n\n")
            let filePath = LogDirPath + Logger.localTime().components(separatedBy: " ")[0]
            do {
                try error.write(toFile: filePath, atomically: true, inAppendMode: true)
                ERROR_BUF = []
            } catch {
                
            }
        }
    }
    
    
    public class func info(_ s: String, function: String = #function) {
        print("INFO: \(function) --- \(s)")
    }
    
    public class func debug(_ s: String, filename: String = #file, line: Int = #line, function: String = #function) {
        if DebugMode {
            
            if let file = filename.components(separatedBy: "/").last {
                print("DEBUG: \(function) --- \(s)")
                
                if SaveToFile {
                    let time = localTime()
                    
                    appendDEBUG("DEBUG:\t\(time),\(file),\(function),\(line) --- \(s)\n")
                    
                }
            }
            
        }
    }
    
    
    public class func warn(_ s: String, filename: String = #file, line: Int = #line, function: String = #function) {
        let mode = "WARN"
        if let file = filename.components(separatedBy: "/").last {
            print("\(mode): \(file)---\(function)---\(line)\n\t\(s)")
        }
    }
    
    
    public class func error(_ s: String, filename: String = #file, line: Int = #line, function: String = #function) {
        
        if let file = filename.components(separatedBy: "/").last {
            
            print("ERROR: \(function) --- \(s)")
            
            if SaveToFile {
                if SaveToFile {
                    let time = localTime()
                    
                    appendERROR("ERROR:\t\(time),\(file),\(function),\(line) --- \(s)\n")
                    
                }
            }
        }
    }
    
    
    
    public class func localTime() -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd HH:mm:ss:SSS"
        return formatter.string(from: Date())
    }
    
    
}
