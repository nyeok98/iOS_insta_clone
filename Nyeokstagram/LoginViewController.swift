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
    
    @IBOutlet var registerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAttribute()
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
    
    @IBAction func registerBtnPushed(_ sender: UIButton) {
//         화면전환
        // 1. 스토리보드를 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // 2. 뷰컨트롤러 설정
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        // 3. 화면전환 메소드를 이용해서 화면을 전환
//        self.present(registerViewController, animated: true)
        self.navigationController?.pushViewController(registerViewController, animated: true)
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
