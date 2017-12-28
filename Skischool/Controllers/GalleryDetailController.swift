//
//  GalleryDetailController.swift
//  Skischool
//
//  Created by Nele Van Melckebeke on 28/12/17.
//  Copyright © 2017 Hogent. All rights reserved.
//

import Foundation
import UIKit

class GalleryDetailController: UITableViewController {
    @IBOutlet weak var thisTableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var image: Image!
    
    override func viewDidAppear(_ animated: Bool) {
        self.titleLabel.text = image.fileName
        let dataDecoded: Data = Data(base64Encoded: image.value!, options: .ignoreUnknownCharacters)!
        let decodedimage = UIImage(data: dataDecoded)
        imageView.image = decodedimage
    }
}
