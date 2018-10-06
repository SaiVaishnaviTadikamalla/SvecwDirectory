//
//  ImageSample.swift
//  Database12
//
//  Created by SVECW-4 on 31/08/18.
//  Copyright © 2018 SVECW-5. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseStorage

class ImageSample: UIViewController {
    @IBOutlet weak var photo: UIImageView!
    var ref :DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photo.image = UIImage(named : "img1.png")
        photo.layer.borderWidth = 1
        photo.layer.masksToBounds = false
        photo.layer.borderColor = UIColor.black.cgColor
        photo.layer.cornerRadius = photo.frame.height/2
        photo.clipsToBounds = true
        /*if let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/sample1-be245.appspot.com/o/images-2.png?alt=media&token=c9c656ac-fd68-4cd4-8dfb-5e5ad107c268") {
            photo.contentMode = .scaleAspectFit
            downloadImage(from: url)
        }*/
        //print("End of code. The image will continue downloading in the background and it will be loaded when it ends.")
            /*let uploadData = UIImagePNGRepresentation(self.photo.image!)
            let storageItem = Storage.storage().reference().child("images-2.png")
            storageItem.putData(uploadData!, metadata: nil) { (metadata, error) in
                if error != nil {
                    print("Couldn't Upload Image")
                } else {
                    print("Uploaded")
                    storageItem.downloadURL(completion: { (url, error) in
                        if error != nil {
                            print(error!)
                            return
                        }
                        if url != nil {
                            print(url!)
                            //self.SetUpUser(Image: url!.absoluteString)
                        }
                    })//str
                }//else
        }*/
        //self.photo.image = UIImage(named : "https://firebasestorage.googleapis.com/v0/b/sample1-be245.appspot.com/o/images-2.png?alt=media&token=c9c656ac-fd68-4cd4-8dfb-5e5ad107c268")
        
        
        //let database = Database.database().reference()
        
        
        /*let storage = Storage.storage().reference()
        let tempImageRef = storage.child("images-2.png")
        tempImageRef.getData(maxSize: 1*1000*1000) {
            (data,error) in
            if error == nil{
                self.photo.image = UIImage(data:data!)
                print(data!)
            }
            else{
                print(error?.localizedDescription)
            }
 
        }*/
        
        
    }
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                self.photo.image = UIImage(data: data)
            }
        }
    }
}
