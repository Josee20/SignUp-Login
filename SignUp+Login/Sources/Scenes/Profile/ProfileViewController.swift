//
//  ProfileViewController.swift
//  SignUp+Login
//
//  Created by 이동기 on 2022/11/02.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class ProfileViewController: BaseViewController {

    let mainView = ProfileView()
    let viewModel = ProfileViewModel()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.requestProfileInfo()
        
        viewModel.profileInfo
            .asDriver(onErrorJustReturn: ProfileInfo(image: "", name: "", email: ""))
            .map { " 이름 : \($0.name)" }
            .drive(mainView.userNameLabel.rx.text)
            .disposed(by: disposeBag)
        
        // 값에 변화가 일어나면 그냥 아무조건 없이 바로 들어오는건가?
        
        viewModel.profileInfo
            .asDriver(onErrorJustReturn: ProfileInfo(image: "", name: "", email: ""))
            .map { " 이메일 : \($0.email)" }
            .drive(mainView.emailLabel.rx.text)
            .disposed(by: disposeBag)
        
//            .bind(onNext: { [weak self] value in
//                self?.mainView.emailLabel.text = value.email
//            })
//            .disposed(by: disposeBag)
        
        viewModel.profileInfo
            .withUnretained(self)
            .bind(onNext: { (vc, value) in
                guard let image = URL(string: value.image) else { return }
                vc.mainView.profileImage.kf.setImage(with: image)
            })
            .disposed(by: disposeBag)
        
//            .asDriver(onErrorJustReturn: ProfileInfo(image: "", name: "", email: ""))
//            .map { $0.image }
//            .drive(mainView.profileImage.kf.setImage(with: <#T##Source?#>)))
//            .disposed(by: disposeBag)

    }
}
