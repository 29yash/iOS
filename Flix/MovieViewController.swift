//
//  MovieViewController.swift
//  Flix
//
//  Created by Yash Mahajan on 2/8/19.
//  Copyright © 2019 Yash Mahajan. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var movies: [[String: Any]] = [];
    var count: Int = 0;
    @IBOutlet weak var MovieTable: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Movie") as! MovieCell
        let movie = movies[indexPath.row]
        // Configure YourCustomCell using the outlets that you've defined.
        if let poster_path = movie["poster_path"] as? String {
            let url = "https://image.tmdb.org/t/p/w185"
            cell.MoviePoster.af_setImage(withURL:  URL(string: url + poster_path)!)
        }
        cell.MovieTitle! .text = movie["title"] as?String
        cell.MovieDetail!.text = movie["overview"] as?String
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieTable.delegate = self
        MovieTable.dataSource = self
//        tableView.estimatedRowHeight = 144.0;
        fetchMovies()

        // Do any additional setup after loading the view.
    }
    
    
    func fetchMovies() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
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
                self.MovieTable.reloadData()
            }
        }
        task.resume()
    }
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let cell = sender as! UITableViewCell;
        let index = MovieTable.indexPath(for: cell);
        let movie = movies[(index?.row)!]
//        print(movie["title"]!);
        let detailViewController = segue.destination as! DetailViewController;
        detailViewController.movie = movie;
        MovieTable.deselectRow(at: index!, animated: true);
    }

}
