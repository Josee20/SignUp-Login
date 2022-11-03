//
//  APIManager.swift
//  SignUp+Login
//
//  Created by 이동기 on 2022/11/02.
//

import Foundation
import Alamofire
import SwiftyJSON

struct Login: Codable {
    let token: String
}

struct Profile: Codable {
    let user: User
}

struct User: Codable {
    let photo: String
    let email: String
    let username: String
}


class APIManager {
    
    private init() { }
    
    static let shared = APIManager()
    
    
    
    func signUp(newUserName: String, newEmail: String, newPassword: String) {
        
        let api = SeSACAPI.signUp(userName: newUserName, email: newEmail, password: newPassword)
        
        AF.request(api.url, method: .post, parameters: api.parameters, headers: api.headers).validate(statusCode: 200...299).responseString { response in

            print(response)
            print(response.response?.statusCode)
        }
    }
    
    func login() {
        let api = SeSACAPI.login(email: "SyncLee@synclee.com", password: "0123456789")
        
        AF.request(api.url, method: .post, parameters: api.parameters, headers: api.headers).validate(statusCode: 200...299).responseDecodable(of: Login.self) { response in
            
            switch response.result {
            case .success(let data):
                print(data.token)
                UserDefaults.standard.set(data.token, forKey: "token")
            case .failure(_):
                print(response.response?.statusCode)
            }
        }
    }
    
    func profile() {
        let api = SeSACAPI.profile
        
        AF.request(api.url, method: .get, headers: api.headers).validate(statusCode: 200...299).responseDecodable(of: Profile.self) { response in
            
            switch response.result {
            case .success(let data):
                print(data)
            case .failure(_):
                print(response.response?.statusCode)
            }
        }
    }
}
