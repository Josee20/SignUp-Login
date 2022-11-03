//
//  EndPoint.swift
//  SignUp+Login
//
//  Created by 이동기 on 2022/11/02.
//

import Foundation
import Alamofire

enum SeSACAPI {
    case signUp(userName: String, email: String, password: String)
    case login(email: String, password: String)
    case profile
}

extension SeSACAPI {
    
    var url: URL {
        switch self {
        case .signUp:
            return URL(string: "http://api.memolease.com/api/v1/users/signup")!
        case .login:
            return URL(string: "http://api.memolease.com/api/v1/users/login")!
        case .profile:
            return URL(string: "http://api.memolease.com/api/v1/users/me")!
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .signUp, .login:
            return ["Content-Type": "application/x-www-form-urlencoded"]
            
        case .profile:
            return [
                "Authorization": "Bearer \(UserDefaults.standard.string(forKey: "token")!)",
                "Content-Type": "application/x-www-form-urlencoded"
            ]
        }
    }
    
    var parameters: [String:String] {
        switch self {
        case .signUp(let username, let email, let password):
            return [
                "userName": "SyncLee",
                "email": "SyncLee@synclee.com",
                "password": "0123456789"
            ]
        case .login(email: let email, password: let password):
            return [
                "email": "SyncLee@synclee.com",
                "password": "0123456789"
            ]
        default: return ["":""]
        }
    }
}
