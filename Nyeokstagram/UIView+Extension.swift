//
//  UIView+Extension.swift
//  Nyeokstagram
//
//  Created by NYEOK on 2022/11/13.
//
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
