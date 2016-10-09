//
//  MovieDetailViewController.swift
//  MovieProject
//
//  Created by Sergey Nevzorov on 10/3/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import UIKit
import SDWebImage

class MovieDetailViewController: UIViewController {
    
    var movieModel: Movie?
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.year.text = movieModel?.year
        self.movieTitle.text = movieModel?.title
        
        if let poster = self.movieModel?.posterURL {
            if let posterUrl = URL(string: poster) {
                self.moviePoster.sd_setImage(with: posterUrl)
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
