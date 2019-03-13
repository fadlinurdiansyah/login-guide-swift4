//
//  HomeController.swift
//  Audible
//
//  Created by NDS on 26/01/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        //        weak var delegate: LoginCellDelegate?
        //        let userName = delegate?.passUserName()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleSignOut))
        navigationItem.title = "We`re logged in"
        let imageView = UIImageView(image: UIImage(named: "home"))
        view.addSubview(imageView)
        _ = imageView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 64, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    /*
     --------------------------------------------------------------
     FUNCTION
     ---------------------------------------------------------------
     */
    
    //Set nilai user default login = false
    @objc func handleSignOut() {
//        UserDefaults.standard.set(false, forKey: "isLoggedIn")
//        UserDefaults.standard.synchronize()
        UserDefaults.standard.setIsLoggedIn(value: false)
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
        
    }
    
}
