//
//  StatementTableViewCell.swift
//  BrunoCcySantander
//
//  Created by Bruno Chen on 17/06/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import UIKit

class StatementTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbValue: UILabel!
  
    var statement: UserProfile.StatementListInfo.ViewModel.DisplayedStatement! {
        
        didSet {
            lbTitle.text = statement.title
            lbDate.text = statement.date
            lbDescription.text = statement.desc
            lbValue.text = statement.value
        }
    }
}
