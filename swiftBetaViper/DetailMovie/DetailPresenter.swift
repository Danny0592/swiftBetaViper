//
//  DetailPresenter.swift
//  swiftBetaViper
//
//  Created by daniel ortiz millan on 10/09/24.
//

import Foundation

class DetailPresenter {
    private let movieId: String
    private let interactor: DetailInteractable
    
    init(movieId: String, 
         interactor: DetailInteractable) {
        self.movieId = movieId
        self.interactor = interactor
    }
    func onViewApperar() {
        Task {
            let model = await interactor.getDetailMovie(withId: movieId)
            print(model)
        }
    }
    
}
