//
//  PopularMovieEntity.swift
//  swiftBetaViper
//
//  Created by daniel ortiz millan on 11/08/24.
//

// MODELO

import Foundation
struct PopularMovieEntity: Decodable {
    
    var id: Int
    var title: String
    var overview: String
    var imageURL: String
    var votes: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case imageURL = "poster_path"
        case votes = "vote_average"
    }
    
}

// struct PopularMovieEntity: Decodable {
//     var id: Int
//     var title: String
//     var overview: String
//     var imageURL: String
//     var votes: Double
//     
//     enum CodingKeys: String, CodingKey {
//         case id
//         case title
//         case overview
//         case imageURL = "poster_path"
//         case votes = "vote_average"
//     }
// }
 
