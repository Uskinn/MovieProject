//
//  MovieDetailViewController.swift
//  MovieProject
//
//  Created by Sergey Nevzorov on 10/3/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movieModel: Movie?
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 }
