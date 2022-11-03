//
//  SignUpViewModel.swift
//  SignUp+Login
//
//  Created by 이동기 on 2022/11/02.
//

import UIKit
import Alamofire
import SwiftyJSON
import RxCocoa
import RxSwift

class SignUpViewModel {
    
    var userName: BehaviorSubject<String> = BehaviorSubject(value: "")
    var userEmail: BehaviorSubject<String> = BehaviorSubject(value: "")
    var userPassword: BehaviorSubject<String> = BehaviorSubject(value: "")
    
    func register(newUserName: String, newEmail: String, newPassword: String) {
        APIManager.shared.signUp(newUserName: newUserName, newEmail: newEmail, newPassword: newPassword)
    }
    
//    func checkValidation(text: String) {
//        userName.value = text
//    }
//
    
}
