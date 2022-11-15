//
//  PostCollectionViewCell.swift
//  Nyeokstagram
//
//  Created by 신동녘 on 2022/11/15.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PostCollectionViewCell"
    
    @IBOutlet weak var postImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func setupDate() {
        // 이미지뷰의 이미지를 업로드한다.
        
    }
}
