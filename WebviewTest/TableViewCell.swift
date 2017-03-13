//
//  TableViewCell.swift
//  WebviewTest
//
//  Created by Zzcz on 2017/3/13.
//  Copyright © 2017年 fly. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleL: UILabel!
    var _moedl : TableViewModel?

    var model : TableViewModel? {
    //MARK: - 赋值
        set {
            titleL.text = newValue!.title 
            _moedl = newValue
        }
        get {
            return _moedl
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
