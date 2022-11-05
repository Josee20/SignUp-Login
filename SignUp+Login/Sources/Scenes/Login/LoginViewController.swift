//
//  LoginViewController.swift
//  SignUp+Login
//
//  Created by 이동기 on 2022/11/02.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: BaseViewController {

    private let mainView = LoginView()
    private let viewModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        viewModel.email
            .withUnretained(self)
            .bind(onNext: { (vc, value) in
                vc.mainView.emailTextField.text = value
            })
            .disposed(by: disposeBag)
        
        viewModel.password
            .withUnretained(self)
            .bind(onNext: { (vc, value) in
                vc.mainView.passwordTextField.text = value
            })
            .disposed(by: disposeBag)
        
        viewModel.loginValidation
            .asDriver(onErrorJustReturn: false)
            .map { $0 == true ? UIColor.green : UIColor.red }
            .drive(mainView.loginButton.rx.backgroundColor)
            .disposed(by: disposeBag)
        
        mainView.loginButton.rx.tap
            .withUnretained(self)
            .bind(onNext: { vc, _ in
                vc.viewModel.login(email: vc.mainView.emailTextField.text!,
                                   password: vc.mainView.passwordTextField.text!
                )
                

                let vc = ProfileViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: disposeBag)
            
    }
    
    override func configure() {
        mainView.emailTextField.addTarget(self, action: #selector(emailTextFieldChanged), for: .editingChanged)
        mainView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldChanged), for: .editingChanged)
    }
    
    @objc private func emailTextFieldChanged() {
        guard let email = mainView.emailTextField.text else { return }
        guard let password = mainView.passwordTextField.text else { return }
        
        viewModel.checkLoginValidation(inputEmailValue: email, inputPasswordValue: password)
        do {
            if try viewModel.passwordValidation.value() && viewModel.emailValidation.value() == true {
                mainView.loginButton.isEnabled = true
            } else {
                mainView.loginButton.isEnabled = false
            }
        } catch {
            print("ERROR")
        }
        
    }
    
    @objc private func passwordTextFieldChanged() {
        guard let email = mainView.emailTextField.text else { return }
        guard let password = mainView.passwordTextField.text else { return }
        
        viewModel.checkLoginValidation(inputEmailValue: email, inputPasswordValue: password)
        do {
            if try viewModel.loginValidation.value() == true {
                mainView.loginButton.isEnabled = true
            } else {
                mainView.loginButton.isEnabled = false
            }
        } catch {
            print("ERROR")
        }
        
    }
}
