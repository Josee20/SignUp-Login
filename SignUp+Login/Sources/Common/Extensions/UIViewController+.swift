//
//  UIViewController+.swift
//  SignUp+Login
//
//  Created by 이동기 on 2022/11/03.
//

import UIKit

extension UIViewController {
    
    public func presentAlert(
        title: String,
        message: String? = nil,
        isIncludedCancel: Bool = false,
        completion: ( (UIAlertAction) -> Void )? = nil
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if isIncludedCancel {
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            alert.addAction(cancel)
        }
        
        let ok = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
