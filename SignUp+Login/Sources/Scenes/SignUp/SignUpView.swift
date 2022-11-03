//
//  SignUpView.swift
//  SignUp+Login
//
//  Created by 이동기 on 2022/11/02.
//

import UIKit

class SignUpView: BaseView {
    
    let nameTextField: BaseTextField = {
        let view = BaseTextField()
        view.placeholder = "이름을 입력해주세요"
        view.setUpTextField()
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
    
    let signUpButton: BaseButton = {
        let view = BaseButton()
        view.setTitle("회원가입", for: .normal)
        view.setUpButton()
        return view
    }()
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = 36
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .equalSpacing
        view.distribution = .fillEqually
        return view
    }()
    
    override func configureUI() {
        [nameTextField, emailTextField, passwordTextField].forEach { self.stackView.addArrangedSubview($0) }
        self.addSubview(stackView)
        self.addSubview(signUpButton)
    }
    
    override func setConstraints() {
        
        stackView.snp.makeConstraints {
            $0.leadingMargin.equalTo(16)
            $0.trailingMargin.equalTo(-16)
            $0.centerY.equalTo(UIScreen.main.bounds.height * 0.4)
            $0.height.equalTo(UIScreen.main.bounds.height * 0.24)
        }
        
        signUpButton.snp.makeConstraints {
            $0.topMargin.equalTo(stackView.snp.bottom).offset(40)
            $0.centerX.equalTo(stackView.self)
            $0.width.equalTo(stackView.snp.width)
            $0.height.equalTo(52)
        }
    }
}
