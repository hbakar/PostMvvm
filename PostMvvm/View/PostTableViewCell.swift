//
//  PostTableViewCell.swift
//  PostMvvm
//
//  Created by Hüseyin BAKAR on 4.12.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet var lblID: UILabel!
    @IBOutlet var lblTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
