//
//  detailViewEntity.swift
//  swiftBetaViper
//
//  Created by daniel ortiz millan on 10/09/24.
//

import Foundation

struct DetailMovieEntity: Decodable {
    let title: String
    let overview: String
    let backdropPath: String
    let status: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
    
}

/*
 struct DetailMovieEntity: Decodable {
     let title: String
     let overview: String
     let backdropPath: String
     let status: String
     let releaseDate: String
     let voteAverage: Double
     let voteCount: Int
 }
 */
