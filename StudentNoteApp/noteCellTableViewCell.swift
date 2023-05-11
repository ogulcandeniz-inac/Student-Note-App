//
//  noteCellTableViewCell.swift
//  StudentNoteApp
//
//  Created by Oğulcan Deniz İnaç on 10.05.2023.
//

import UIKit

class noteCellTableViewCell: UITableViewCell {

    @IBOutlet weak var labelClass: UILabel!
    @IBOutlet weak var labelNote1: UILabel!
    @IBOutlet weak var labelNote2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
