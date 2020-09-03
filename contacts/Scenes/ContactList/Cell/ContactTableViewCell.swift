//
//  ContactTableViewCell.swift
//  mycontacts
//
//  Created by Ryniere dos Santos Silva on 2020-09-02.
//  Copyright © 2020 Ryniere dos Santos Silva. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWith(contact: Contact) {
        
        firstNameLabel.text = contact.firstName
        lastNameLabel.text = contact.lastName
        phoneNumberLabel.text = contact.phoneNumber
    }

}
