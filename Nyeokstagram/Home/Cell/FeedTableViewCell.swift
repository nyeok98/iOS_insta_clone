//
//  FeedTableViewCell.swift
//  Nyeokstagram
//
//  Created by NYEOK on 2022/11/14.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    @IBOutlet var imageViewUserProfile: UIImageView!
    @IBOutlet var labelUserName: UILabel!
    @IBOutlet var imageViewFeed: UIImageView!
    @IBOutlet var isLikedBtn: UIButton!
    @IBOutlet var isBookMarkedBtn: UIButton!
    @IBOutlet var howManyLikes: UILabel!
    @IBOutlet var feedContent: UILabel!
    @IBOutlet var imageViewMyProfile: UIImageView!

    @IBAction func isLikedPushed(_ sender: Any) {
        if isLikedBtn.isSelected {
            isLikedBtn.isSelected = false
        } else {
            isLikedBtn.isSelected = true
        }
    }

    @IBAction func isBookMarkedPushed(_ sender: Any) {
        if isBookMarkedBtn.isSelected {
            isBookMarkedBtn.isSelected = false
        } else {
            isBookMarkedBtn.isSelected = true
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageViewUserProfile.layer.cornerRadius = 9
        imageViewUserProfile.clipsToBounds = true
        imageViewMyProfile.layer.cornerRadius = 9
        imageViewMyProfile.clipsToBounds = true

        let fontSize = UIFont.boldSystemFont(ofSize: 9)
        let attributedStr = NSMutableAttributedString(string: feedContent.text ?? "")
        attributedStr.addAttribute(.font, value: fontSize, range: NSRange(location: 0, length: 3))

        feedContent.attributedText = attributedStr
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
