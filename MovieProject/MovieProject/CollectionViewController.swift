//
//  CollectionViewController.swift
//  MovieProject
//
//  Created by Sergey Nevzorov on 10/2/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import UIKit
import SDWebImage

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    
    var moviesArray = [Movie]()
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchTerms = ["Peace", "War", "Love"]
        
        OmdbApiClient.getMovieWithCompletion(searchTerm: searchTerms[0]) { results in
            guard let searchedMovies = results["Search"] as? [[String: Any]] else {return print("error ")}
            for movie in searchedMovies {
                let newMovie = Movie(details: movie)
                self.moviesArray.append(newMovie)
            }
            OperationQueue.main.addOperation({
                self.movieCollectionView.reloadData()
            })
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.moviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCollectionViewCell
        let movie = self.moviesArray[(indexPath as IndexPath).row]
        // print(movie.posterURL)
        let moviPoster = movie.posterURL
        if let poster = URL(string: moviPoster) {
            cell.moviePoster.sd_setImage(with: poster)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetailVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let indexPaths = self.movieCollectionView.indexPathsForSelectedItems {
                let indexPath = indexPaths[0]
                let destinationVC = segue.destination as! MovieDetailViewController
                destinationVC.movieModel = self.moviesArray[indexPath.row]
            } else {
                print("error occured")
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
