//
//  SuperheroViewController.swift
//  Flix
//
//  Created by Yash Mahajan on 2/14/19.
//  Copyright © 2019 Yash Mahajan. All rights reserved.
//

import UIKit
import AlamofireImage;

class SuperheroViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var superheroGrif: UICollectionView!
    var movies: [[String: Any]] = [];
    var count: Int = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        superheroGrif.dataSource = self;
        superheroGrif.delegate = self;
        fetchSuperheroMovies();
        // Do any additional setup after loading the view.
    }
    
    func fetchSuperheroMovies() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                self.count = dataDictionary["total_results"] as! Int;
                let responseDictionary = dataDictionary["results"] as! [[String:Any]];
                //                print(responseDictionary)
                // Store the returned array of dictionaries in our posts property
                self.movies = responseDictionary
                print( self.movies)
                self.superheroGrif.reloadData()
            }
        }
        task.resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuperheroCell", for: indexPath) as! SuperheroCell
        let movie = movies[indexPath.item]
        // Configure YourCustomCell using the outlets that you've defined.
        if let poster_path = movie["poster_path"] as? String {
            let url = "https://image.tmdb.org/t/p/w185"
            cell.posterView.af_setImage(withURL:  URL(string: url + poster_path)!)
        }
        return cell; 
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
