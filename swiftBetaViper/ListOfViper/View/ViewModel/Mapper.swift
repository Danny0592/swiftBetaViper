//
//  mapper.swift
//  swiftBetaViper
//
//  Created by daniel ortiz millan on 09/09/24.
//

import Foundation

struct Mapper {
    func map(entity: PopularMovieEntity) -> viewModel {
        viewModel(title: entity.title,
                  overview: entity.overview,
                  imageURL: URL(string: "https://image.tmdb.org/t/p/w200" + entity.imageURL))
    }
}
