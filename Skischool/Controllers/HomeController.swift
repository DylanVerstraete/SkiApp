//
//  HomeController.swift
//  Skischool
//
//  Created by Nele Van Melckebeke on 27/12/17.
//  Copyright © 2017 Hogent. All rights reserved.
//


import UIKit


class HomeController: UITableViewController {
    @IBOutlet weak var aantalKaartenLabel: UILabel!
    @IBOutlet weak var aantalSkibeurtenLabel: UILabel!
    @IBOutlet weak var koopkaartButton: UIButton!
    @IBOutlet weak var lidstatusLabel: UILabel!
    @IBOutlet weak var wordLidButton: UIButton!
    
    var currentUser: User?

    override func viewDidLoad() {
        super.viewDidLoad()
       fillUser()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fillUser(){
        UserService.getCurrentUser(succes: { (user) in
            self.currentUser = user
            if(user.totalskicards == 0){
                self.aantalKaartenLabel.text = "0 skikaarten"
                self.aantalSkibeurtenLabel.text = "0 skibeurten"
            }else{
                self.aantalKaartenLabel.text = "Je hebt " + String(user.totalskicards) + " skikaarten"
                self.aantalSkibeurtenLabel.text = "Je hebt " + String(user.totalskiturns) + " skibeuren"
            }
            
            if(user.member.isMember){
                self.lidstatusLabel.text = "Je bent lid bij ons!"
                self.wordLidButton.setTitle("Schrijf jezelf uit", for: .normal)
                //self.wordLidButton.isHidden = true
            }else{
                self.lidstatusLabel.text = "Je bent nog geen lid bij ons!"
                self.wordLidButton.setTitle("Word lid", for: .normal)
                //self.wordLidButton.isHidden = false
            }
        }) { (error) in
            print(error)
        }
    }
    
    @IBAction func buyCard(){
        UserService.addCard(succes: {
            self.fillUser()
        }) { (error) in
            print(error)
        }
    }
    
    @IBAction func changeMemberStatus(){
        if(self.currentUser?.member.isMember)!{
            UserService.AddMember(succes: {
                self.fillUser()
            }, failure: { (error) in
                print(error)
            })
        }else{
            UserService.deleteMember(succes: {
                self.fillUser()
            }, failure: { (error) in
                print(error)
            })
        }
    }
    
    @IBAction func logout(_ sender: Any){
        self.performSegue(withIdentifier: "logout", sender: self)
    }
}

