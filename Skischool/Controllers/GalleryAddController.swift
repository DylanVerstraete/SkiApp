//
//  GalleryAddController.swift
//  Skischool
//
//  Created by Nele Van Melckebeke on 28/12/17.
//  Copyright © 2017 Hogent. All rights reserved.
//

import Foundation
import UIKit
import Photos
class GalleryAddController: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var thisTableView: UITableView?
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var descriptionLabel: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var uploadButton: UIButton!
    var imgPicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        imgPicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func choosePicture(){
        imgPicker.allowsEditing = false
        imgPicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imgPicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(imgPicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imgPicker.dismiss(animated: true, completion: nil)
        self.imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    @IBAction func addPhoto(){
        let value = UIImagePNGRepresentation(self.imageView.image!)!.base64EncodedString(options: .lineLength64Characters)

        let img = Image(value: value, fileName: titleLabel.text!)
        
        UserService.AddImage(image: img, succes: {
            self.performSegue(withIdentifier: "addGaleryItem", sender: self)
        }) { (error) in
            print(error)
        }
    }

}

