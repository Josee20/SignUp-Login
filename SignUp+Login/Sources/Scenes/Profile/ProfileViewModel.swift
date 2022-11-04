//
//  ProfileViewModel.swift
//  SignUp+Login
//
//  Created by 이동기 on 2022/11/02.
//

import Foundation
import Alamofire
import SwiftyJSON
import RxCocoa
import RxSwift

struct ProfileInfo {
    var image: String
    var name: String
    var email: String
}

class ProfileViewModel {
    
    var profileInfo: BehaviorSubject<ProfileInfo> = BehaviorSubject(value: ProfileInfo(image: "", name: "", email: ""))
    
    func requestProfileInfo() {
        APIManager.shared.profile(completion: { json in

            let profile = ProfileInfo(image: json.user.photo,
                                      name: json.user.username,
                                      email: json.user.email
            )
            
            print("+++++++++++++++++\(profile)")
            self.profileInfo.onNext(profile)
        })
    }
    
    
}
