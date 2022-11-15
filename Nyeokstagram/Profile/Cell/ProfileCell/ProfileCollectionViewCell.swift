//
//  ProfileCollectionViewCell.swift
//  Nyeokstagram
//
//  Created by 신동녘 on 2022/11/15.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    // MARK: - Property
    static let identifier = "ProfileCollectionViewCell"

    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var addStoryBtnView: UIImageView!
    
    @IBOutlet weak var postingCountLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAttribute()
    }
    
    private func setupAttribute() {
        profileView.layer.cornerRadius = 88/2
        addStoryBtnView.layer.cornerRadius = 24/2
        
        [postingCountLabel, followerCountLabel, followingCountLabel]
            .forEach{ $0.text = "\(Int.random(in: 0...999))" }
    }
}
