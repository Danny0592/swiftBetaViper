//
//  ListOfMoviesPresenter.swift
//  swiftBetaViper
//
//  Created by daniel ortiz millan on 10/08/24.
//

import Foundation

protocol ListOfMoviesUI: AnyObject {
    func update(movies: [PopularMovieEntity])
}

class ListOfMoviesPresenter {
    var ui: ListOfMoviesUI?
    private let listOfMoviesInteractor: ListOfMoviewsInteractor

    init(listOfMoviesInteractor: ListOfMoviewsInteractor = ListOfMoviewsInteractor()) {
        self.listOfMoviesInteractor = listOfMoviesInteractor
    }
    
    func onViewAppear() {
        Task {
            let models = await listOfMoviesInteractor.getListOfMovies()
            ui?.update(movies: models.results)
        }
    }
}

// protocol ListOfMoviesUI: AnyObject {
//     func update(movies: [PopularMovieEntity])
// }
// 
// 
// class ListOfMoviesPresenter {
//     var ui: ListOfMoviesUI?
//     private let listOfMoviesInteractor: ListOfMoviewsInteractor
//     
//     init(listOfMoviesInteractor: ListOfMoviewsInteractor = ListOfMoviewsInteractor()) {
//         self.listOfMoviesInteractor = listOfMoviesInteractor
//     }
//     
//     func onViewAppear() {
//         Task {
//             let models = await listOfMoviesInteractor.getListOfMovies()
//             ui?.update(movies: models.results)
//         }
//     }
// }
 
 
