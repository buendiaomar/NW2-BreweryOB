//
//  DetailViewController.swift
//  musicDom
//
//  Created by Consultant on 2/27/22.
//

import UIKit

class DetailViewController: UIViewController {
     
    //@IBOutlet weak var descriptionLabel: UILabel!
    //@IBOutlet weak var imageView: UIImageView!
    //@IBOutlet weak var expLabel: UILabel!
    
    @IBOutlet weak var streetLabel: UILabel!
    
    @IBOutlet weak var website_urlLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    
    //transit variables
    var tranStreet = ""
    var tranWebSite_url = ""
    var tranName=""
    
    //var img = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //imageView.image = img
        //expLabel.text=setDetail()
        streetLabel.text = tranStreet
        website_urlLabel.text = tranWebSite_url
        nameLabel.text = tranName

    }

    
}

