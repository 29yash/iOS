//
//  DetailViewController.swift
//  Flix
//
//  Created by Yash Mahajan on 2/8/19.
//  Copyright © 2019 Yash Mahajan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var movie :[String:Any]! 
    
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var overlay: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = movie["title"] as? String;
        desc.text = movie["overview"] as? String;
        let baseURL =  "https://image.tmdb.org/t/p/";
        let posterPath = movie["poster_path"] as? String;
        let overlayPath = movie["backdrop_path"] as? String;
        let posterURL = URL(string: baseURL + "w185" + posterPath!)!
        let overlayURL = URL(string: baseURL + "w780" + overlayPath!)!
        poster.af_setImage(withURL: posterURL)
        overlay.af_setImage(withURL: overlayURL)
        desc.sizeToFit();
        name.sizeToFit();
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
