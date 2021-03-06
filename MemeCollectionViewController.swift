//
//  MemeCollectionViewController.swift
//  Meme Me V1.0
//
//  Created by Michael Doroff on 1/7/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import UIKit
import Foundation


class MemeCollectionViewController: UICollectionViewController {

    var memes: [Meme]!
    private let reuseIdentifier = "MemeCollectionViewCell"
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        collectionView?.reloadData()
    }
    
    


    // MARK: UICollectionViewDataSource
    @IBAction func callMemeCreatorViewController(_ sender: Any) {
    
    let memeViewController = storyboard!.instantiateViewController(withIdentifier: "MemeEditorViewController")
        
    present(memeViewController, animated: true, completion: nil)
    
    
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return  memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print("This collection view method is called")
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MemeCollectionViewCell
        let meme = memes[(indexPath as NSIndexPath).row]
        
        
        // Configure the cell
        
        cell.labelTop!.text = meme.topText!
        cell.labelBottom!.text = meme.bottomText!
        cell.imageView!.image = meme.originalImage!
        
        return cell
    }
    
    
    @IBAction func CallMemeViewController(_ sender: Any) {
    
            
    let memeViewController = storyboard!.instantiateViewController(withIdentifier: "MemeEditorViewController")
            
    present(memeViewController, animated: true, completion: nil)
            
        
    
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let meme =  memes[(indexPath as NSIndexPath).row]
        let memedetailviewcontroller = storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        memedetailviewcontroller.chosenMeme = meme
        navigationController?.pushViewController(memedetailviewcontroller, animated: true)
    }


}
