//
//  Movie+CoreDataProperties.swift
//  MovieProject
//
//  Created by Sergey Nevzorov on 10/9/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import Foundation
import CoreData


extension ManagedMovie {

    @NSManaged public var title: String?
    @NSManaged public var year: String?
    @NSManaged public var type: String?
    @NSManaged public var imdbID: String?
    @NSManaged public var director: String?
    @NSManaged public var posterURL: String?
    @NSManaged public var actors: String?
    @NSManaged public var imdbRating: String?
    @NSManaged public var metaScore: String?
    @NSManaged public var plot: String?
    @NSManaged public var writer: String?
    @NSManaged public var genre: String?

}
