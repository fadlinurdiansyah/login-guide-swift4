//
//  MainNavigationController.swift
//  Audible
//
//  Created by NDS on 26/01/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

class MainNavigationCotroller: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set warna background view
        view.backgroundColor = UIColor.white
        
        //Cek status login pada user default
        if isLoggedIn() {
            //Jika login true tampilkan home menu
            let homeController = HomeController()
            viewControllers = [homeController]
        } else {
            //Jika tidak login tampilkan login menu
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        }
    }
    
    
    /*
     --------------------------------------------------------------
     FUNCTION
     ---------------------------------------------------------------
     */
    
    //Set nilai user default login = true
    fileprivate func isLoggedIn() -> Bool {
       return UserDefaults.standard.isLoggedIn()
    }
    
    //Menampilkan login view controlloer
    @objc func showLoginController() {
        let loginController = LoginController()
        present(loginController, animated: true) {
            //competion
        }
        
    }
}

