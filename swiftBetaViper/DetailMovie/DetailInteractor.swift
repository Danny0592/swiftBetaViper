//
//  DetailInteractor.swift
//  swiftBetaViper
//
//  Created by daniel ortiz millan on 10/09/24.
//

import Foundation
protocol DetailInteractable: AnyObject {
    func getDetailMovie (withId id: String) async -> DetailMovieEntity
}

class DetailInteractor: DetailInteractable {
    func getDetailMovie (withId id: String) async -> DetailMovieEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=9b613bd3667f7fd328e037601b2f457b")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let JsonDecoder = JSONDecoder()
        JsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! JsonDecoder.decode(DetailMovieEntity.self, from: data)
    }
}

/*
 class DetailInteractor {
     func getDetailMovie(withId id: String) async -> DetailMovieEntity {
         let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=02face8651c1fbb596638eaa99e07790")!
         let (data, _) = try! await URLSession.shared.data(from: url)
         let jsonDecoder = JSONDecoder()
         jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
         return try! jsonDecoder.decode(DetailMovieEntity.self, from: data)
     }
 }
 */
