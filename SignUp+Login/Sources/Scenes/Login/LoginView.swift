//
//  LoginView.swift
//  SignUp+Login
//
//  Created by 이동기 on 2022/11/02.
//

import UIKit

class LoginView: BaseView {
    
    let loginButton: BaseButton = {
        let view = BaseButton()
        view.setTitle("로그인", for: .normal)
        view.setUpButton()
        return view
    }()
    
    let emailTextField: BaseTextField = {
        let view = BaseTextField()
        view.placeholder = "이메일을 입력해주세요"
        view.setUpTextField()
        return view
    }()
    
    let passwordTextField: BaseTextField = {
        let view = BaseTextField()
        view.placeholder = "비밀번호를 입력해주세요"
        view.setUpTextField()
        return view
    }()
    
    override func configureUI() {
        [emailTextField, passwordTextField, loginButton].forEach { self.addSubview($0) }
    }
    
    override func setConstraints() {
        
        let space = 36
        
        emailTextField.snp.makeConstraints {
            $0.centerY.equalTo(UIScreen.main.bounds.height * 0.38)
            $0.leadingMargin.equalTo(20)
            $0.trailingMargin.equalTo(-20)
            $0.topMargin.equalTo(100)
            $0.height.equalTo(48)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.leading.equalTo(emailTextField.snp.leading)
            $0.width.equalTo(emailTextField.snp.width)
            $0.height.equalTo(emailTextField.snp.height)
            $0.topMargin.equalTo(emailTextField.snp.bottom).offset(space)
        }
        
        loginButton.snp.makeConstraints {
            $0.leading.equalTo(emailTextField.snp.leading)
            $0.width.equalTo(emailTextField.snp.width)
            $0.height.equalTo(52)
            $0.topMargin.equalTo(passwordTextField.snp.bottom).offset(space)
            
        }
    }
    
}
