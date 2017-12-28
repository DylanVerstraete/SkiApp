import Foundation
import UIKit
class GalleryController: UITableViewController{
    
    @IBOutlet weak var thisTableView: UITableView!
    @IBOutlet weak var picture: UIImageView!
    var images: [Image] = [Image]()
    var indexPathToEdit: IndexPath = IndexPath()
    
    override func viewDidAppear(_ animated: Bool) {
       fillGalery()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "galleryCell", for: indexPath) as! GalleryCell
        cell.photo = self.images[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.indexPathToEdit = indexPath
        self.performSegue(withIdentifier: "showGaleryItemDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier!) {
        case "showGaleryItemDetail":
            let img = images[self.indexPathToEdit.row]
            let detailController = segue.destination as! GalleryDetailController
            detailController.image = img
            break
        case "addGaleryItem":
            print("succes")
        default:
            fatalError("Unknown segue")
        }
    }
    
    @IBAction func unwindFromGalleryAdd(_ segue: UIStoryboardSegue) {
        switch (segue.identifier!) {
        case "addGaleryItem":
            print("added item")
            fillGalery()
        default:
            fatalError("Unknown segue")
        }
    }
    
    func fillGalery(){
        UserService.GetImages(succes: { (images) in
            self.images = images
            for img in images {
                print(img.fileName)
            }
            self.thisTableView.reloadData()
        }) { (error) in
            print(error)
        }
    }
    
}
