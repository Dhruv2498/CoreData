//
//  UserListTableViewCell.swift
//  CoreDataTask
//
//  Created by Mac on 29/09/23.
//

import UIKit

class UserListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var lblphone: UILabel!
    @IBOutlet weak var lblage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
