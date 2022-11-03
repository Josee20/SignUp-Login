//
//  SignUpViewController.swift
//  SignUp+Login
//
//  Created by 이동기 on 2022/11/02.
//

import UIKit
import RxSwift
import RxCocoa


class SignUpViewController: BaseViewController {

    let mainView = SignUpView()
    var viewModel = SignUpViewModel()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.signUpButton.isEnabled = false
        
        viewModel.userName
            .bind { value in
                self.mainView.nameTextField.text = value
            }
            .disposed(by: disposeBag)
        

    }
    
    
    override func configureUI() {
        mainView.nameTextField.addTarget(self, action: #selector(nameTextFieldChanged), for: .editingChanged)
        mainView.emailTextField.addTarget(self, action: #selector(emailTextFieldChanged), for: .editingChanged)
        mainView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldChanged), for: .editingChanged)
    }
    
    @objc func nameTextFieldChanged() {
        guard let text = mainView.nameTextField.text else { return }
        viewModel
    }
    
    @objc func emailTextFieldChanged() {
        
    }
    
    @objc func passwordTextFieldChanged() {
        
    }
    
}
