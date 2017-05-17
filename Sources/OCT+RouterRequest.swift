////
////  OCT+RouterRequest.swift
////  OCTMemberServer
////
////  Created by yuhan zhang on 11/26/16.
////
////
//
//import Foundation
//import Kitura
//import OCTJSON
//
//
//public extension RouterResponse {
//    
//    public func send(_ s: CustomStringConvertible) -> RouterResponse {
//        return self.send(s.description)
//    }
//    
//}
//
//
//
//public extension RouterRequest {
//    
//    public var jsonBody: JSON? {
//        do {
//            
//            guard let s = try self.readString() else {
//                return nil
//            }
//            
//            return try JSON.deserialize(s)
//            
//        } catch {
//            return nil
//        }
//    }
//    
//}
//
//
//
//
//
//
//
