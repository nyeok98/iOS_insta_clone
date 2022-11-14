//
//  StoryCollectionViewCell.swift
//  Nyeokstagram
//
//  Created by NYEOK on 2022/11/14.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet var viewImageViewBackground: UIView!
    @IBOutlet var viewUserProfileBackground: UIView!
    @IBOutlet var imageViewUserProfile: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        viewImageViewBackground.layer.cornerRadius = 24
        viewUserProfileBackground.layer.cornerRadius = 23.5
        imageViewUserProfile.layer.cornerRadius = 22.5
        imageViewUserProfile.clipsToBounds = true
    }
}
