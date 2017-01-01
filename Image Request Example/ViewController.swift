//
//  ViewController.swift
//  Image Request Example
//
//  Created by Zulwiyoza Putra on 1/1/17.
//  Copyright © 2017 Zulwiyoza Putra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup the URL of image
        let imageURL = URL(string: "http://www.mydogtrainingonline.com/images/how-to-train-your-dog.jpg")!
        
        let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            
            if error == nil {
                let downloadedImage = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.imageView.image = downloadedImage
                }
            }
            
            print("task finished")
        }
        
        task.resume()
    }

}
