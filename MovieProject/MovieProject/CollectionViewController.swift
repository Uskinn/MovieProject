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
        
        let searchTerms = ["Taxi", "", ""]
        
        OmdbApiClient.getMovieWithCompletion(searchTerm: searchTerms[0]) { results in
            
            let searchedMovies = results["Search"] as! [[String: Any]]
 
            for movie in searchedMovies {
                
                let newMovie = Movie(details: movie)
                
                print("\n\nnew movie object:\n\(newMovie)\n\n")
    
                self.moviesArray.append(newMovie)
                
            
            }
            
            // pop on the main thread and reload the collection view to view new information
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: MovieCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCollectionViewCell
        
        
        let imageData = NSData(contentsOf: self.moviesArray)
        let image = UIImage(data: imageData)
        
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
