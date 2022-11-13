//
//  RegisterViewController.swift
//  Nyeokstagram
//
//  Created by NYEOK on 2022/11/12.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties

    // 유효성 검사를 위한 프로퍼티
    var isValidEmail = false {
        didSet { // 프로퍼티 옵저버
            validateUserInfo()
        }
    }
    
    var isValidName = false {
        didSet { // 프로퍼티 옵저버
            validateUserInfo()
        }
    }
    
    var isValidUsername = false {
        didSet { // 프로퍼티 옵저버
            validateUserInfo()
        }
    }
    
    var isValidPassword = false {
        didSet { // 프로퍼티 옵저버
            validateUserInfo()
        }
    }
    
    // TextField
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var usernameTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var signUpBtn: UIButton!
    
    @IBOutlet var popToLoginBtn: UIButton!
    
    var textFields: [UITextField] {
        [emailTextField, nameTextField, usernameTextField, passwordTextField]
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        setupAttribute()
        
        // bug fix
        navigationController?
            .interactivePopGestureRecognizer?.delegate = nil
    }
    
    // MARK: - Actions

    @objc
    func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            isValidEmail = text.isValidEmail()
        case nameTextField:
            isValidName = text.count > 2
        case usernameTextField:
            isValidUsername = text.count > 2
        case passwordTextField:
            isValidPassword = text.isValidPassword()
        default:
            fatalError("Missing TextFields...")
        }
    }
    
    @IBAction func backBtnDidTap(_ sender: UIBarButtonItem) {
        // 뒤로가기
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helpers

    private func setupTextField() {
        textFields.forEach { tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
    }
    
    // 사용자 입력정보 확인 후 UI 업데이트
    private func validateUserInfo() {
        if isValidEmail,
           isValidName,
           isValidUsername,
           isValidPassword
        {
            signUpBtn.isEnabled = true
            UIView.animate(withDuration: 0.33) {
                self.signUpBtn.backgroundColor = UIColor(named: "facebookColor")
            }
            
        } else {
            signUpBtn.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                self.signUpBtn.backgroundColor = UIColor(named: "disabledBtnColor")
            }
        }
    }
    
    private func setupAttribute() {
        // registerBtn
        
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor(named: "facebookColor")
        
        let attributes = generateButtonAttribute(popToLoginBtn, texts: text1, text2, fonts: font1, font2, colors: color1, color2 ?? UIColor.blue)
        
        popToLoginBtn.setAttributedTitle(attributes, for: .normal)
    }
}

// 정규표현식
extension String {
    // 대문자, 소문자, 특수문자, 숫자 8자 이상일 때 -> True
    func isValidPassword() -> Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        
        return passwordValidation.evaluate(with: self)
    }
    
    // @포함 두글자 이상 -> True
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailValidation = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return emailValidation.evaluate(with: self)
    }
}
