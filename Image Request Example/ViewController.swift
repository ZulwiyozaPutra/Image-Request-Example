//
//  ViewController.swift
//  Image Request Example
//
//  Created by Zulwiyoza Putra on 1/1/17.
//  Copyright © 2017 Zulwiyoza Putra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    //Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup the URL of image
        let imageURL = URL(string: Constants.PuppyURL)!
        
        //Create a network request
        let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            
            if error == nil {
                
                //Create an image
                let downloadedImage = UIImage(data: data!)
                
                //Update the UI
                performUIUpdatesOnMain {
                    self.imageView.image = downloadedImage
                }

            } else {
                print(error!)
            }
            
            print("task finished")
        }
        
        //Start network request
        task.resume()
    }

}
