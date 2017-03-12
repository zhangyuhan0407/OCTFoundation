//
//  OCTResponse.swift
//  OCTMemberServices
//
//  Created by yuhan zhang on 6/14/16.
//  Copyright © 2016 octopus. All rights reserved.
//


import OCTJSON


public typealias OCTResponseCallback = (OCTResponse) -> ()


public enum OCTResponse: CustomStringConvertible {
    
    case Succeed(data: JSON)
    case EmptyResult
    case NetWorkError
    
    case InputEmpty
    case InputFormatError
    
    case PasswordError
    case UserExists
    case UserNotExists
    case AccountOrPasswordError
    case UserParamsError
    
    
    case ServerError
    case UnknownError
    
    
    
    public var code: Int {
        switch self {
        case .Succeed:
            return 0
        case .EmptyResult:
            return 1
            
            
        case .NetWorkError:
            return 10000
            
        
        case .PasswordError:
            return 20000
        case .UserExists:
            return 20001
        case .UserNotExists:
            return 20002
        case .AccountOrPasswordError:
            return 20003
        case .UserParamsError:
            return 20004
        case .InputEmpty:
            return 20005
        case .InputFormatError:
            return 20006
            
        case .ServerError:
            return 30000
            
            
        case .UnknownError:
            return 40000
        }
    }
    
    
    public var message: String {
        switch self {
        case .Succeed:
            return "succeed"
        case .EmptyResult:
            return "succeed with empty result"
        case .NetWorkError:
            return "net work error"
        case .PasswordError:
            return "account or password error"
        case .UserExists:
            return "user exists"
        case .UserNotExists:
            return "user not exists"
        case .AccountOrPasswordError:
            return "用户名或密码错误"
        case .UserParamsError:
            return "user params error"
        case .InputEmpty:
            return "input empty"
        case .InputFormatError:
            return "input format error"
        case .ServerError:
            return "server error"
        case .UnknownError:
            return "unkown error"
        }
    }
    
    
    public var data: JSON {
        switch self {
        case .Succeed(let data):
            return data
        default:
            return JSON([:] as [String: Any])
        }
    }
    
    
    
    public var description: String {
        return JSON(["code": code, "message": message, "data": data]).description
    }
    
    
}

