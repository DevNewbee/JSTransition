//
//  JSTableViewCell.swift
//  JSPopupTransition
//
//  Created by 王俊硕 on 2017/11/13.
//  Copyright © 2017年 王俊硕. All rights reserved.
//

import UIKit

class JSTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
//        if highlighted {
//            contentView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
//        }
    
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        contentView.transform = CGAffineTransform(scaleX: 1, y: 1)

        // Configure the view for the selected state
    }
    
    
    
    func setup(title: String, subtitle: String, imageName image: String, description: String) {
        titleLabel.attributedText = NSAttributedString(string: title, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 26), NSAttributedStringKey.foregroundColor: UIColor.white])
        descriptionLabel.attributedText = NSAttributedString(string: description, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.white])
        subtitleLabel.attributedText = NSAttributedString(string: description, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.white])
        coverImageView.image = UIImage(named: image)
        coverImageView.layer.cornerRadius = 20
        coverImageView.clipsToBounds = true
        coverImageView.contentMode = .top
    }
}
extension CGRect {
    func scaleToCenter(_ r: CGFloat) -> CGRect {
        let factor = 0.5*(1-r)
        return CGRect(x: -factor*width, y: -factor*height, width: width*r, height: height*r)
    }
}

