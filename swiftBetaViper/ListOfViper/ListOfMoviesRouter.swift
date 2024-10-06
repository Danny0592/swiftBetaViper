//
//  ListOfMoviesRouter.swift
//  swiftBetaViper
//
//  Created by daniel ortiz millan on 10/08/24.

import Foundation
import UIKit

protocol ListOfMoviesRouting: AnyObject{
    var detailRouter: DetailRouting? { get }
    var listOfMoviesView: ListOfMoviesView? { get }
    
    func showListOfMovies(window: UIWindow?)
    func showDetailMovie(withMovieId movieId: String)
}

class ListOfMoviesRouter: ListOfMoviesRouting {
    var detailRouter: DetailRouting?
    var listOfMoviesView: ListOfMoviesView?
    
    
    func showListOfMovies(window: UIWindow?) {
        self.detailRouter = DetailRouter()
        let interactor = ListOfMoviewInteractor()
        //        let interactor = ListOfMoviesInteractorMock()
        let presenter = ListOfMoviesPresenter(listOfMoviesInteractor: interactor,
                                              router: self)
        
        listOfMoviesView = ListOfMoviesView(presenter: presenter)
        presenter.ui = listOfMoviesView
        //        view.presenter = presenter
        
        window?.rootViewController = listOfMoviesView
        window?.makeKeyAndVisible()
    }
    
    func showDetailMovie(withMovieId movieId: String) {
        guard let fromViewController = listOfMoviesView else {
            return
        }
        
        detailRouter?.showDetail(fromViewViewController: fromViewController,
                                 withMovieId: movieId)
    }
}




// CODIGO ORIGINAL
// class ListOfMoviesRouter {
//     func showListOfMovies(window: UIWindow?) {
//         let view = ListOfMoviesView()
//         let presenter = ListOfMoviesPresenter()
//         presenter.ui = view
//         view.presenter = presenter
//         
//         window?.rootViewController = view
//         window?.makeKeyAndVisible()
//     }
// }
 
