//
//  ProfileController.swift
//  Skischool
//
//  Created by Nele Van Melckebeke on 27/12/17.
//  Copyright © 2017 Hogent. All rights reserved.
//

import UIKit


class ProfileController: UITableViewController {
    
    var currentUser: User?
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressstreetLabel: UILabel!
    @IBOutlet weak var addressnumberLabel: UILabel!
    @IBOutlet weak var addresspostalcodeLabel: UILabel!
    @IBOutlet weak var addresscityLabel: UILabel!
    @IBOutlet weak var telephonenumberLabel: UILabel!
    @IBOutlet weak var lidstatus: UILabel!
    @IBOutlet weak var lidButton: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        fillUser()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func editProfile(_ sender: Any) {
        self.performSegue(withIdentifier: "editProfile", sender: self)
    }
    
    @IBAction func unwindFromProfileEdit(_ segue: UIStoryboardSegue) {
        switch (segue.identifier!) {
        case "didEditProfile":
            fillUser()
            print("Did edit")
        default:
            fatalError("Unknown segue")
        }
    }
    
    func fillUser(){
        UserService.getCurrentUser(succes: { (user) in
            self.currentUser = user
            self.emailLabel.text = UserService.email
            self.nameLabel.text = user.firstname! + " " + user.lastname!
            self.addressstreetLabel.text = user.address! + " " + user.addressnumber!
            self.addresspostalcodeLabel.text = user.addresspostalcode ?? ""
            self.addresscityLabel.text = user.addresscity ?? ""
            self.telephonenumberLabel.text = user.telephonenumber ?? ""
            
            if(user.member.isMember){
                self.lidstatus.text = "Je bent lid bij ons!"
                self.lidButton.isHidden = true
            }else{
                self.lidstatus.text = "Je bent nog geen lid bij ons!"
                self.lidButton.isHidden = false
            }
        }) { (error) in
            print(error)
        }
    }
}
