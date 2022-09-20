//
//  TableViewCell.swift
//  GitConnectionWithXcode
//
//  Created by Auropriya Sinha on 20/09/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var personName : UILabel!
    @IBOutlet weak var personImage : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        personName.isAccessibilityElement = true
        personImage.isAccessibilityElement = true
        personImage.accessibilityHint = "person image"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
