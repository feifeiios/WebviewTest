//
//  TableViewModel.swift
//  WebviewTest
//
//  Created by Zzcz on 2017/3/13.
//  Copyright © 2017年 fly. All rights reserved.
//

import UIKit

class TableViewModel: NSObject {
    var title : String = ""
    var urlString : String = ""
    static let properties = ["title","urlString"]
    
    init(dict : [String : AnyObject]) {
        super.init()
        for key in TableViewModel.properties {
            if dict[key] != nil {
                setValue(dict[key], forKey: key)
            }
        }
    }
    override var description: String {
        let dict = dictionaryWithValuesForKeys(TableViewModel.properties)
        return ("\(dict)")
    }

}
