//
//  OmdbApiClient.swift
//  MovieProject
//
//  Created by Sergey Nevzorov on 10/3/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import Foundation

class OmdbApiClient {
    
    class func getMovieWithCompletion(searchTerm: String, completion: @escaping ([String: Any]) -> Void) {
        
        let session = URLSession.shared
        
        let searchString = searchTerm.replacingOccurrences(of: " ", with: "+")
        
        let urlString = "https://www.omdbapi.com/?s=\(searchString)"
        
        let url = URL(string: urlString)
        
        guard let unwrappedUrl = url else {return}
        
        let dataTask = session.dataTask(with: unwrappedUrl) { (data, response, error) in
            
            guard let data = data else {fatalError("\(error)") }
            
            if let responseData = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                
                guard let responseJson = responseData else {return}
                
                completion(responseJson)
            }
        }
        dataTask.resume()
    }
}
