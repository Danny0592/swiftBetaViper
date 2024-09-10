//
//  ListOfMoviesInteractor.swift
//  swiftBetaViper
//
//  Created by daniel ortiz millan on 10/08/24.
//

// 9b613bd3667f7fd328e037601b2f457b

import Foundation

protocol ListOfMoviewsInteractortable: AnyObject {
    func getListOfMovies() async -> PopularMovieResponseEntity
    
}

class ListOfMoviewInteractor: ListOfMoviewsInteractortable {
    
    func getListOfMovies() async -> PopularMovieResponseEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=9b613bd3667f7fd328e037601b2f457b")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
}

class ListOfMoviesInteractorMock: ListOfMoviewsInteractortable {
    func getListOfMovies() async -> PopularMovieResponseEntity {
        return PopularMovieResponseEntity(results: [
            .init(id: 0, title: "Daniel Ortiz", overview: "Curso Viper", imageURL: "", votes: 10),
            .init(id: 1, title: "Daniel Ortiz", overview: "Curso Viper Swift", imageURL: "", votes: 10),
            .init(id: 2, title: "Daniel Ortiz", overview: "Curso Viper SwiftUI", imageURL: "", votes: 10),
            .init(id: 3, title: "Daniel Ortiz", overview: "Curso Viper Xcode", imageURL: "", votes: 10),
            .init(id: 4, title: "Daniel Ortiz", overview: "Curso Viper IOS", imageURL: "", votes: 10),
            .init(id: 5, title: "Daniel Ortiz", overview: "Curso Viper Combine", imageURL: "", votes: 10),
            
        ])
    }
    
    
}


// CODIGO ORIGINAL
// class ListOfMoviewsInteractor {
//     func getListOfMovies() async -> PopularMovieResponseEntity {
//         let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=9b613bd3667f7fd328e037601b2f457b")!
//         let (data, _) = try! await URLSession.shared.data(from: url)
//         return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
//     }
// }
 
