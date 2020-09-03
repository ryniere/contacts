//
//  ContactListViewModel.swift
//  contacts
//
//  Created by Ryniere dos Santos Silva on 2020-09-02.
//  Copyright © 2020 Ryniere dos Santos Silva. All rights reserved.
//

import Foundation
import Contacts

class ContactListViewModel {
    
    
    var reloadTableViewClosure: (()->())?
    
    var contacts = [Contact]()
    var filteredContacts = [Contact]()
    
    func fetchContacts() {
        
         let store = CNContactStore()
        
        store.requestAccess(for: .contacts) { (granted, error) in
        
           if let error = error {
                print("failed to request access", error)
                return
            }
            
            if granted {
                print("access granted")
                
                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                
                do {
                    try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in
                        print(contact.givenName)
                        self.contacts.append(Contact(firstName: contact.givenName, lastName: contact.familyName, phoneNumber: contact.phoneNumbers.first?.value.stringValue ?? ""))
                    })
                    self.reloadTableViewClosure?();
                } catch let error {
                    print("Failed to enumerate contact", error)
                }
            } else {
                print("access denied")
            }
        }
    }
    
    func filterContacts(text:String) {
        
        self.filteredContacts = contacts.filter { (contact : Contact) -> Bool in
            return contact.firstName.lowercased().contains(text) || contact.lastName.lowercased().contains(text) || contact.phoneNumber.lowercased().contains(text)
        }
        
        
         self.reloadTableViewClosure?();
        
    }
}
