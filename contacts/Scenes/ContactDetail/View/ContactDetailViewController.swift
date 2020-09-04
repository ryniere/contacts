//
//  ContactDetailViewController.swift
//  MyContacts
//
//  Created by Ryniere dos Santos Silva on 2020-09-03.
//  Copyright © 2020 Ryniere dos Santos Silva. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    let viewModel = ContactDetailViewModel()
    
    @IBOutlet weak var initialsLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        guard let contact = viewModel.contact else { return  }
        initialsLabel.text = "\(contact.firstName.first!)\(contact.lastName.first!)"
        firstNameLabel.text = contact.firstName
        lastNameLabel.text = contact.lastName
        phoneNumberLabel.text = contact.phoneNumber
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
