import Foundation
import UIKit

class GalleryCell: UITableViewCell{
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var photo: Image! {
        didSet {
            let dataDecoded: Data = Data(base64Encoded: photo.value!, options: .ignoreUnknownCharacters)!
            let decodedimage = UIImage(data: dataDecoded)
            picture.image = decodedimage
        }
    }
}
