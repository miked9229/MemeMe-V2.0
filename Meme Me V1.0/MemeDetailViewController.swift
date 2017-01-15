//
//  MemeDetailViewController.swift
//  Meme Me V1.0
//
//  Created by Michael Doroff on 1/13/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {

 
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bottomLabel: UILabel!
    
    var chosenMeme:Meme!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    
   //topLabel.text = chosenMeme.topText
   //bottomLabel.text = chosenMeme.bottomText
   imageView.image = chosenMeme.memedImage
   imageView.contentMode = .scaleAspectFit
        
    }

    

}
