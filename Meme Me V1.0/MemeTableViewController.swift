//
//  MemeTableViewController.swift
//  Meme Me V1.0
//
//  Created by Michael Doroff on 1/7/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import UIKit
import Foundation


class MemeTableViewController: UITableViewController {

    var memes: [Meme]!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    
        tableView?.reloadData()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        
    }

    
    @IBAction func callMemeViewController(_ sender: Any) {
    
        let memeViewController = storyboard!.instantiateViewController(withIdentifier: "MemeEditorViewController")
        
        present(memeViewController, animated: true, completion: nil)
    
    }
    
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("This tableViewMethod method is called")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")!
        let meme = memes[(indexPath as NSIndexPath).row]
        
        // Set the name and image
        cell.textLabel?.text = (meme.topText!) + (meme.bottomText!)
        cell.imageView?.image = meme.memedImage!
        
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            memes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meme =  memes[(indexPath as NSIndexPath).row]
        let memedetailviewcontroller = storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
      memedetailviewcontroller.chosenMeme = meme
    navigationController?.pushViewController(memedetailviewcontroller, animated: true)
    }
    

}
