//
//  LoginViewController.swift
//  Nyeokstagram
//
//  Created by NYEOK on 2022/11/12.
//
import UIKit
import Alamofire

class LoginViewController: UIViewController {
    var email: String?
    var password: String?
    var userInfo: UserInfo?
    
    @IBOutlet var registerBtn: UIButton!
    @IBOutlet var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAttribute()
    }
    
    @IBAction func emailTextFieldChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.loginBtn.backgroundColor = text.isValidEmail() ? UIColor(named: "facebookColor") : UIColor(named: "disabledBtnColor")
        self.email = text
    }
    
    @IBAction func passwordTextFieldChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.loginBtn.backgroundColor = text.count > 2 ? UIColor(named: "facebookColor") : UIColor(named: "disabledBtnColor")
        
        self.password = text
    }
    
    @IBAction func loginBtnPushed(_ sender: UIButton) {
        // 회원가입 정보 전달받고, 그것과 TextField 데이터가 일치하면, 로그인 되어야함.
        guard let userInfo = self.userInfo else { return }
        if userInfo.email == self.email, userInfo.password == self.password {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        } else {}
    }
    
    @IBAction func registerBtnPushed(_ sender: UIButton) {
//         화면전환
        // 1. 스토리보드를 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // 2. 뷰컨트롤러 설정
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        // 3. 화면전환 메소드를 이용해서 화면을 전환
        
        self.navigationController?.pushViewController(registerViewController, animated: true)
        
        // 클로저를 통해 RegisterVC의 정보를 받는다
        // ARC -> 강한참조 / 약한참조; 약한참조는 ARC를 낮춰줌
        registerViewController.userInfo = { [weak self] userInfo in
            self?.userInfo = userInfo
        }
    }
    
    private func setupAttribute() {
        // registerBtn
        
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor(named: "facebookColor")
        
        let attributes = generateButtonAttribute(self.registerBtn, texts: text1, text2, fonts: font1, font2, colors: color1, color2 ?? UIColor.blue)
        
        self.registerBtn.setAttributedTitle(attributes, for: .normal)
    }
}
