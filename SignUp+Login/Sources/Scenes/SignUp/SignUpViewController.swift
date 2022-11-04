//
//  SignUpViewController.swift
//  SignUp+Login
//
//  Created by 이동기 on 2022/11/02.
//

import UIKit
import RxSwift
import RxCocoa

final class SignUpViewController: BaseViewController {

    private let mainView = SignUpView()
    private let  viewModel = SignUpViewModel()
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.signUpButton.isEnabled = false
        
        viewModel.userName
            .withUnretained(self)
            .bind(onNext: { (vc, value) in
                vc.mainView.nameTextField.text = value
            })
            .disposed(by: disposeBag)
        
        viewModel.userEmail
            .withUnretained(self)
            .bind(onNext: { (vc, value) in
                vc.mainView.emailTextField.text = value
            })
            .disposed(by: disposeBag)
        
        viewModel.userPassword
            .withUnretained(self)
            .bind(onNext: { (vc, value) in
                vc.mainView.passwordTextField.text = value
            })
            .disposed(by: disposeBag)
        
        viewModel.validationCheck
            .withUnretained(self)
            .bind(onNext: { (vc, value) in
                vc.mainView.signUpButton.isEnabled = value
                if value == true {
                    vc.mainView.signUpButton.backgroundColor = .green
                } else {
                    vc.mainView.signUpButton.backgroundColor = .red
                }
            })
            .disposed(by: disposeBag)
        
        mainView.signUpButton.rx.tap
            .withUnretained(self)
            .bind(onNext: { (vc, _) in
                vc.viewModel.register(newUserName: vc.mainView.nameTextField.text ?? "",
                                         newEmail: vc.mainView.emailTextField.text ?? "",
                                         newPassword: vc.mainView.passwordTextField.text ?? ""
                )
                vc.transition(LoginViewController(), transitionStyle: .presentFullScreen)
            })
            .disposed(by: disposeBag)
        
    }
    
    override func configure() {
        mainView.nameTextField.addTarget(self, action: #selector(nameTextFieldChanged), for: .editingChanged)
        mainView.emailTextField.addTarget(self, action: #selector(emailTextFieldChanged), for: .editingChanged)
        mainView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldChanged), for: .editingChanged)
    }
    
    @objc private func nameTextFieldChanged() {
        guard let name = mainView.nameTextField.text else { return }
        guard let email = mainView.emailTextField.text else { return }
        guard let password = mainView.passwordTextField.text else { return }
        viewModel.checkValidation(name: name, email: email, password: password)
    }
    
    @objc private func emailTextFieldChanged() {
        guard let name = mainView.nameTextField.text else { return }
        guard let email = mainView.emailTextField.text else { return }
        guard let password = mainView.passwordTextField.text else { return }
        viewModel.checkValidation(name: name, email: email, password: password)
    }
    
    @objc private func passwordTextFieldChanged() {
        guard let name = mainView.nameTextField.text else { return }
        guard let email = mainView.emailTextField.text else { return }
        guard let password = mainView.passwordTextField.text else { return }
        viewModel.checkValidation(name: name, email: email, password: password)
    }
}
