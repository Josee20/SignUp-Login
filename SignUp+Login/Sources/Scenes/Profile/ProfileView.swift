//
//  ProfileView.swift
//  SignUp+Login
//
//  Created by 이동기 on 2022/11/02.
//

import UIKit

class ProfileView: BaseView {
    
    let profileImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let userNameLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .boldSystemFont(ofSize: 20)
        view.text = " 이름 : 이동기"
        view.textColor = .white
        return view
    }()
    
    let emailLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 20)
        view.text = " 이메일 : a@a.com"
        view.textColor = .white
        return view
    }()
    
    override func configureUI() {
        [profileImage, userNameLabel, emailLabel].forEach { self.addSubview($0) }
    }
    
    override func setConstraints() {
        profileImage.snp.makeConstraints {
            $0.centerY.equalTo(UIScreen.main.bounds.height * 0.38)
            $0.leadingMargin.equalTo(60)
            $0.trailingMargin.equalTo(-60)
            $0.height.equalTo(300)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.width.equalTo(profileImage.snp.width)
            $0.leading.equalTo(profileImage.snp.leading)
            $0.topMargin.equalTo(profileImage.snp.bottom).offset(40)
            $0.height.equalTo(44)
        }
        
        emailLabel.snp.makeConstraints {
            $0.width.equalTo(profileImage.snp.width)
            $0.leading.equalTo(profileImage.snp.leading)
            $0.height.equalTo(36)
            $0.topMargin.equalTo(userNameLabel.snp.bottom).offset(20)
        }
    }
    
}
