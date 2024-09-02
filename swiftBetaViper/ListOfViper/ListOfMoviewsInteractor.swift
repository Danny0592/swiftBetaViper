//
//  ListOfMoviesInteractor.swift
//  swiftBetaViper
//
//  Created by daniel ortiz millan on 10/08/24.
//

// 9b613bd3667f7fd328e037601b2f457b

import Foundation

class ListOfMoviewsInteractor {
    
    func getListOfMovies() async -> PopularMovieResponseEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=9b613bd3667f7fd328e037601b2f457b")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
}

// class ListOfMoviewsInteractor {
//     func getListOfMovies() async -> PopularMovieResponseEntity {
//         let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=9b613bd3667f7fd328e037601b2f457b")!
//         let (data, _) = try! await URLSession.shared.data(from: url)
//         return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
//     }
// }
 
