//
//  SingleNewsTableViewCell.swift
//  TinkoffNewsFeed
//
//  Created by roman on 15/05/2019.
//  Copyright © 2019 roman. All rights reserved.
//

import UIKit

class SingleNewsTableViewCell: UITableViewCell, NibLoadable {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewedCountLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func layoutSubviews() {
        //super.layoutSubviews()
        Decorator.decorate(self)
    }
    
}

extension SingleNewsTableViewCell {
    fileprivate class Decorator {
        static func decorate(_ cell: SingleNewsTableViewCell) {
            cell.backgroundColor = UIColor.clear
            cell.titleLabel.textColor = UIColor.white
            cell.viewedCountLabel.textColor = UIColor.white
            cell.containerView.backgroundColor = #colorLiteral(red: 0.2196078431, green: 0.231372549, blue: 0.3137254902, alpha: 1)
            cell.selectionStyle = .none
            cell.containerView.layer.cornerRadius = 8.0
            let shadowPath = UIBezierPath(rect: cell.containerView.bounds)
            cell.containerView.layer.masksToBounds = false
            cell.containerView.layer.shadowColor = UIColor.black.cgColor
            cell.containerView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            cell.containerView.layer.shadowOpacity = 0.1
            cell.containerView.layer.shadowPath = shadowPath.cgPath
        }
    }
}
