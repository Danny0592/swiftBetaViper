//
//  ListOfMoviesRouter.swift
//  swiftBetaViper
//
//  Created by daniel ortiz millan on 10/08/24.

import Foundation
import UIKit

class ListOfMoviesRouter {
    func showListOfMovies(window: UIWindow?) {
        let interactor = ListOfMoviewInteractor()
//        let interactor = ListOfMoviesInteractorMock()
        let presenter = ListOfMoviesPresenter(listOfMoviesInteractor: interactor)
      
        let view = ListOfMoviesView(presenter: presenter)
        presenter.ui = view
//        view.presenter = presenter
        
        window?.rootViewController = view
        window?.makeKeyAndVisible()
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
 
