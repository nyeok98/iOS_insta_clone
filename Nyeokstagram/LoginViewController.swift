//
//  LoginViewController.swift
//  Nyeokstagram
//
//  Created by NYEOK on 2022/11/12.
//

import UIKit

class LoginViewController: UIViewController {
    var email: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func emailTextFieldChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.email = text
    }
    
    @IBAction func passwordTextFieldChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.password = text
    }
    
    @IBAction func loginBtnPushed(_ sender: UIButton) {}
    
    @IBAction func registerBtnPushed(_ sender: UIButton) {}
}
