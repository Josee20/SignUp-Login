//
//  TextField+.swift
//  SignUp+Login
//
//  Created by 이동기 on 2022/11/02.
//

import UIKit

    
class BaseTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpTextField() {
        textColor = .black
        backgroundColor = .darkGray
        clipsToBounds = true
        layer.cornerRadius = 12
    }
}

