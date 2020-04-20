//
//  MyTableViewCell.swift
//  VoiceOverBug
//
//  Created by Tejas Lagvankar on 4/20/20.
//  Copyright © 2020 Tejas Lagvankar. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet var myLabel: UILabel!
    
    func configure() {
        myLabel.text = "Label Text"
    }
}
