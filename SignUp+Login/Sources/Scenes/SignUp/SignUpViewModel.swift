//
//  SignUpViewModel.swift
//  SignUp+Login
//
//  Created by 이동기 on 2022/11/02.
//

import Foundation
import Alamofire
import SwiftyJSON
import RxCocoa
import RxSwift

class SignUpViewModel {
    
    let disposeBag = DisposeBag()
    
    var userName: BehaviorSubject<String> = BehaviorSubject(value: "")
    var userEmail: BehaviorSubject<String> = BehaviorSubject(value: "")
    var userPassword: BehaviorSubject<String> = BehaviorSubject(value: "")
    var validationCheck: BehaviorSubject<Bool> = BehaviorSubject(value: false)
    
    
    var userNameValidation: BehaviorSubject<Bool> = BehaviorSubject(value: false)
    var userEmailValidation: BehaviorSubject<Bool> = BehaviorSubject(value: false)
    var userPasswordValidation: BehaviorSubject<Bool> = BehaviorSubject(value: false)
    
    func register(newUserName: String, newEmail: String, newPassword: String) {
        APIManager.shared.signUp(newUserName: newUserName, newEmail: newEmail, newPassword: newPassword)
    }
    
    func checkValidation(name: String, email: String, password: String) {
        
        userName.onNext(name)
        userEmail.onNext(email)
        userPassword.onNext(password)
        
        if name.count >= 2 && name.count <= 10 &&
            email.contains(".com") && email.contains("@") && email.count >= 7 && email.count <= 20 &&
            password.count >= 8 {
            
            validationCheck.onNext(true)
        } else {
            validationCheck.onNext(false)
        }
    }
    
    func userNameValidation(text: String) {
        if text.count >= 2 && text.count <= 10 {
            userNameValidation.onNext(true)
            userName.onNext(text)
        }
    }
    
    func userEmailValidation(text: String) {
        if text.contains(".com") && text.contains("@") && text.count >= 7 && text.count <= 20 {
            userEmailValidation.onNext(true)
            userEmail.onNext(text)
        }
    }
    
    func userPasswordValidation(text: String) {
        if text.count >= 8 {
            userPasswordValidation.onNext(true)
            userPassword.onNext(text)
        }
    }
}

