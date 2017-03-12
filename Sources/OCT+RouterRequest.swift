//
//  OCT+RouterRequest.swift
//  OCTMemberServer
//
//  Created by yuhan zhang on 11/26/16.
//
//

import Foundation
import Kitura
import OCTJSON
import OCTFoundation



extension RouterResponse {
    
    func send(_ s: OCTResponse) -> RouterResponse {
        return self.send(s.description)
    }
    
    
    func send(_ json: JSON) -> RouterResponse {
        return self.send(json.description)
    }
    
}

extension RouterRequest {
    
    var jsonBody: JSON? {
        do {
            
            guard let s = try self.readString() else {
                return nil
            }
            
            return try JSON.deserialize(s)
            
        } catch {
            return nil
        }
    }
    
}







