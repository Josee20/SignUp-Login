//
//  LoginViewModel.swift
//  SignUp+Login
//
//  Created by 이동기 on 2022/11/02.
//

import Foundation
import Alamofire
import SwiftyJSON
import RxCocoa
import RxSwift

final class LoginViewModel {
    
    public var observableEmail: Observable<String> = Observable.just("")
    
    var email: BehaviorSubject<String> = BehaviorSubject(value: "")
    var password: BehaviorSubject<String> = BehaviorSubject(value: "")
    var loginValidation: BehaviorSubject<Bool> = BehaviorSubject(value: false)
    
    public var emailValidation: BehaviorSubject<Bool> = BehaviorSubject(value: false)
    public var passwordValidation: BehaviorSubject<Bool> = BehaviorSubject(value: false)
    
    func login(email: String, password: String) {
        APIManager.shared.login(email: email, password: password)
    }
    
    func checkLoginValidation(inputEmailValue: String, inputPasswordValue: String) {
        email.onNext(inputEmailValue)
        password.onNext(inputPasswordValue)
        
        if inputEmailValue.contains("@") && inputEmailValue.contains(".com") &&
            inputPasswordValue.count >= 8 {
            loginValidation.onNext(true)
        } else {
            loginValidation.onNext(false)
        }
    }
    
    
//    func checkEmailValidation(text: String) {
//        email.onNext(text)
//        if text.contains("@") && text.contains(".com") {
//            emailValidation.onNext(true)
//        } else {
//            emailValidation.onNext(false)
//        }
//    }
//
//    func checkPasswordValidation(text: String) -> Bool {
//        password.onNext(text)
//        if text.count >= 8 {
//            return true
//        } else {
//            return false
//        }
//    }
    
    func checkTokenValidation() { }
}
