import Foundation
import UIKit

class ProfileEditController: UITableViewController {
    
    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    @IBOutlet weak var streetField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var postalCodeField: UITextField!
    @IBOutlet weak var telephoneNumberField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserService.getCurrentUser(succes: { (user) in
            self.firstnameField.text = user.firstname ?? ""
            self.lastnameField.text = user.lastname ?? ""
            self.streetField.text = user.address ?? ""
            self.numberField.text = user.addressnumber ?? ""
            self.cityField.text = user.addresscity ?? ""
            self.postalCodeField.text = user.addresspostalcode ?? ""
            self.telephoneNumberField.text = user.telephonenumber ?? ""
        }) { (error) in
            print(error)
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func EditProfile(_ sender: Any) {
        let userObj = User(firstname: firstnameField.text!, lastname: lastnameField.text!, address:streetField.text!, addresspostalcode:postalCodeField.text!, addresscity:cityField.text!, addressnumber:numberField.text!,   telephonenumber:telephoneNumberField.text!)
        UserService.updateUser(user: userObj, succes: {
            print("succes")
            self.performSegue(withIdentifier: "didEditProfile", sender: self)
        }) { (error) in
            print("error")
        }
    }
    
   
}


