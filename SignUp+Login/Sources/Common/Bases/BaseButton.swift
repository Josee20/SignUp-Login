//
//  UIButton+.swift
//  SignUp+Login
//
//  Created by 이동기 on 2022/11/02.
//

import UIKit

class BaseButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpButton() {
        layer.cornerRadius = 12
        clipsToBounds = true
        setTitleColor(.black, for: .normal)
        backgroundColor = .red
    }
}
