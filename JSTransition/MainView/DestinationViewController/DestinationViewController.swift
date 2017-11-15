//
//  DemoViewController.swift
//  CustomTransitionDemo
//
//  Created by 王俊硕 on 2017/10/11.
//  Copyright © 2017年 王俊硕. All rights reserved.
//

import UIKit
class DestinationViewController: UIViewController {
    var fromViewOffset: CGFloat?
    var maskView: UIView?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var coverImageLeading: NSLayoutConstraint!
    @IBOutlet weak var coverImageTrailing: NSLayoutConstraint!
    @IBOutlet weak var coverImageHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maskView = UIView()
        maskView!.frame = view.frame
//        coverImageView.contentMode = .
        maskView!.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1)
        view.sendSubview(toBack: coverImageView)
        view.addSubview(maskView!)
        coverImageView.layer.cornerRadius = 20
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        maskView?.removeFromSuperview()
        coverImageView.layer.cornerRadius = 0
        self.coverImageLeading.constant -= 20
        self.coverImageTrailing.constant -= 20
        self.coverImageHeight.constant = 495
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }
        
//        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveEaseInOut, animations: {
//            self.view.layoutIfNeeded()
//
//        }, completion: nil)
        

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       

    }
    func setup(withData data: CellData) {
        titleLabel.attributedText = NSAttributedString(string: data.title, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 26), NSAttributedStringKey.foregroundColor: UIColor.white])
        descriptionLabel.attributedText = NSAttributedString(string: data.description, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.white])
        subtitleLabel.attributedText = NSAttributedString(string: data.subtitle, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.white])
        coverImageView.image = UIImage(named: data.image)
        coverImageView.contentMode = .top
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
