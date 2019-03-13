//
//  UserDefaults+helper.swift
//  Audible
//
//  Created by NDS on 26/01/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation

//Tambah method pada UserDefaults
extension UserDefaults {
    
    enum UserDefaultsKeys: String {
        case isLoggedIn
    }
    
    func setIsLoggedIn(value: Bool) {
        set(false, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        synchronize()
    }
    
    func isLoggedIn() -> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
}
