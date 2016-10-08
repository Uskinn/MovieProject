//
//  Movie.swift
//  MovieProject
//
//  Created by Sergey Nevzorov on 10/3/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import Foundation

struct Movie {
    
    // The five values received from a search query
    var title: String
    var year: String
    var imdbID: String
    var type: String
    var posterURL: String
    
    // Other values received from subsequent network calls
    var director: String?
    var actors: String?
    var imdbRating: String?
    var metaScore: String?
    var plot: String?
    var writer: String?
    var genre: String?
    
    init(details: [String: Any]) {
        
        self.title = details["Title"] as! String
        self.year = details["Year"] as! String
        self.imdbID = details["imdbID"] as! String
        self.type = details["Type"] as! String
        self.posterURL = details["Poster"] as! String
        
    }
    
    mutating func updateMovieWith(details: [String: Any]) {
        
        self.director = ""
        
        
    }
    
    

}
