//
//  CollectionViewController.swift
//  MovieProject
//
//  Created by Sergey Nevzorov on 10/2/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    
    var moviesArray = [Movie]()
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchTerms = ["Love", "", ""]
        
        OmdbApiClient.getMovieWithCompletion(searchTerm: searchTerms[0]) { results in
            
            let searchedMovies = results["Search"] as! [[String: Any]]
 
            for movie in searchedMovies {
                
                let newMovie = Movie(details: movie)
                
               // print("\n\nnew movie object:\n\(newMovie)\n\n")
    
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
        
        let cell: MovieCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCollectionViewCell
        
        let movie = self.moviesArray[(indexPath as IndexPath).row]
        
        print(movie.posterURL)
        
       let moviPoster = movie.posterURL
        if let poster = URL(string: moviPoster) {
            
            if let dataPoster = NSData(contentsOf: poster) {
                 cell.moviePoster.image = UIImage(data: dataPoster as Data)
            }
   
        
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showMovie", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showMovie" {
            
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
