//
//  ListOfMoviesPresenter.swift
//  swiftBetaViper
//
//  Created by daniel ortiz millan on 10/08/24.
//

import Foundation

protocol ListOfMoviesPresentable: AnyObject {
    var ui: ListOfMoviesUI? { get }
    var viewModels: [viewModel] { get }
    func onViewAppear()
}

protocol ListOfMoviesUI: AnyObject {
    func update(movies: [viewModel])
}

class ListOfMoviesPresenter: ListOfMoviesPresentable {
    weak  var ui: ListOfMoviesUI?
    
    private let listOfMoviesInteractor: ListOfMoviewsInteractortable
    var viewModels: [viewModel] = []
    private let mapper: Mapper
    

    init(listOfMoviesInteractor: ListOfMoviewsInteractortable,
         mapper: Mapper = Mapper()) {
        self.listOfMoviesInteractor = listOfMoviesInteractor
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task {
            let models = await listOfMoviesInteractor.getListOfMovies().results
            viewModels = models.map(mapper.map(entity:))
            ui?.update(movies: viewModels)
        }
    }
}

// CODIGO ORIGINAL
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
 
 
