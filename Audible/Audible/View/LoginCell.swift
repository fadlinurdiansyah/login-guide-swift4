//
//  LoginCell.swift
//  Audible
//
//  Created by NDS on 24/01/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

//MARK: Protocol kirim nilai email textfield
protocol LoginCellDelegate: class {
    func passUserName() -> String
}

class LoginCell: UICollectionViewCell, LoginCellDelegate {
    
    /*
    --------------------------------------------------------------
     DECLARATION
    ---------------------------------------------------------------
     */
    
    let logoImageView: UIImageView = {
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let emailTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = "Enter email"
        textField.layer.borderColor = UIColor.lightGray.cgColor
//        textField.layer.borderWidth = 1
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let passwordTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = "Enter password"
        textField.layer.borderColor = UIColor.lightGray.cgColor
//        textField.layer.borderWidth = 1
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.init(red: 250/255, green: 156/255, blue: 0/255, alpha: 1)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    //MARK:Set delegate
    weak var delegate: LoginControllerDelegate?
    
    @objc func handleLogin() {
//        print("TeSS")
      delegate?.finishLoggingIn()
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: UI Component
        backgroundColor = UIColor.white
        addSubview(logoImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        
        //MARK: Autolayout
       _ = logoImageView.anchor(centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -100, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 100, heightConstant: 100)
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        _ = emailTextField.anchor(logoImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0  , heightConstant: 40)
        
        _ = passwordTextField.anchor(emailTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32 , bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 40)
        
        _ = loginButton.anchor(passwordTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 40)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /*
     --------------------------------------------------------------
     FUNCTION
     ---------------------------------------------------------------
     */
    
    func passUserName() -> String {
        var userName: String?
        userName = emailTextField.text
        return userName!
    }
    
}

//MARK: Custome textfield (ubah jarak posisi sebelah kirim dari isi textfield)
class LeftPaddedTextField: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
}
