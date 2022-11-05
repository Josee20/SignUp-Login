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
    
    let followersLabel: UILabel = {
        let view = UILabel()
        view.text = "팔로워 : 0"
        return view
    }()
    
    let followingLabel: UILabel = {
        let view = UILabel()
        view.text = "팔로잉: 0"
        return view
    }()
    
    let logOutButton: UIButton = {
        let view = UIButton()
        view.setTitle("로그아웃", for: .normal)
        view.backgroundColor = .red
        view.setTitleColor(.white, for: .normal)
        return view
    }()
    
    override func configureUI() {
        [profileImage, userNameLabel, emailLabel, followersLabel, followingLabel, logOutButton].forEach { self.addSubview($0) }
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
        
        followersLabel.snp.makeConstraints {
            $0.leading.equalTo(emailLabel.snp.leading)
            $0.height.equalTo(30)
            $0.topMargin.equalTo(emailLabel.snp.bottom).offset(20)
        }
        
        followingLabel.snp.makeConstraints {
            $0.leadingMargin.equalTo(followersLabel.snp.trailing).offset(32)
            $0.height.equalTo(30)
            $0.top.equalTo(followersLabel.snp.top)
        }
        
        logOutButton.snp.makeConstraints {
            $0.leading.equalTo(profileImage.snp.leading)
            $0.height.equalTo(40)
            $0.width.equalTo(profileImage.snp.width)
            $0.topMargin.equalTo(followersLabel.snp.bottom).offset(44)
        }
    }
    
}
