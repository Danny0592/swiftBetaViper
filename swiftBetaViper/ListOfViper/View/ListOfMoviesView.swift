//
//  ListOfMoviesView.swift
//  swiftBetaViper
//
//  Created by daniel ortiz millan on 10/08/24.
//

import Foundation
import UIKit

class ListOfMoviesView: UIViewController {
    var presenter: ListOfMoviesPresenter?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        presenter?.onViewAppear()
    }
}

extension ListOfMoviesView: ListOfMoviesUI {
    func update(movies: [PopularMovieEntity]) {
        print("Datos recibidos \(movies)")
    }
}




//          >>>>> CODIGO ORIGINAL DEL CURSO<<<<<

// class ListOfMoviesView: UIViewController {
//     var presenter: ListOfMoviesPresenter?
//     
//     init() {
//         super.init(nibName: nil, bundle: nil)
//     }
//     
//     required init?(coder: NSCoder) {
//         fatalError("init(coder:) has not been implemented")
//     }
//     
//     override func viewDidLoad() {
//         super.viewDidLoad()
//         
//         view.backgroundColor = .blue
//         presenter?.onViewAppear()
//     }
// }
// 
// extension ListOfMoviesView: ListOfMoviesUI {
//     func update(movies: [PopularMovieEntity]) {
//         print("Datos recibidos \(movies)")
//     }
// }
 
