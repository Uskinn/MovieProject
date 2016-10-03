//
//  Movie.swift
//  MovieProject
//
//  Created by Sergey Nevzorov on 10/3/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import Foundation

struct Movie {
    
    var title: String?
    var year: String?
    var director: String?
    var actors: String?
    var imdbRating: String?
    var metaScore: String?
    var plot: String?
    var poster: String?
    var writer: String?
    var genre: String?
    var imdbID: String?
    
    static func mapFromDictionary(movieDictionary: NSDictionary) -> Movie {
        
        var movie = Movie()
        
        if let dictionary = movieDictionary as? [String: Any] {
            
            movie.title = dictionary["Title"] as? String
            movie.year = dictionary["Year"] as? String
            movie.director = dictionary["Director"] as? String
            movie.actors = dictionary["Actos"] as? String
            movie.imdbRating = dictionary["imdbRating"] as? String
            movie.metaScore = dictionary["Metascore"] as? String
            movie.plot = dictionary["Plot"] as? String
            movie.poster = dictionary["Poster"] as? String
            movie.writer = dictionary["Writer"] as? String
            movie.genre = dictionary["Genre"] as? String
            movie.imdbID = dictionary["imdbID"] as? String
        }
        return movie
    }
}
