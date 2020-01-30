//
//  BeritaTableViewCell.swift
//  Portal Berita
//
//  Created by Rasyid Respati Wiriaatmaja on 30/01/20.
//  Copyright © 2020 rasyidrw. All rights reserved.
//

import UIKit

class BeritaTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
