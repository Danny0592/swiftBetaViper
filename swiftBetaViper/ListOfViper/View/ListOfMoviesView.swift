//
//  ListOfMoviesView.swift
//  swiftBetaViper
//
//  Created by daniel ortiz millan on 10/08/24.
//

import Foundation
import UIKit

class ListOfMoviesView: UIViewController {
    private var moviesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MovieCellView.self, forCellReuseIdentifier: "MovieCellView")
        return tableView
        
    }()
    
    private let presenter: ListOfMoviesPresentable
    
    init(presenter: ListOfMoviesPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        setupTableView()
        presenter.onViewAppear()
    }
    
    private func setupTableView() {
        view.addSubview(moviesTableView)
        
        NSLayoutConstraint.activate([
            moviesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moviesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            moviesTableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
        
    }
}

extension ListOfMoviesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCellView", for: indexPath) as! MovieCellView
        cell.backgroundColor = .white
        let model = presenter.viewModels[indexPath.row]
        
        cell.configure(model: model)
        return cell
    }
}

extension ListOfMoviesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt  indexPath: IndexPath) {
        presenter.onTapCell(atIndex: indexPath.row)
    }
}

extension ListOfMoviesView: ListOfMoviesUI {
    func update(movies: [viewModel]) {
        print("Datos recibidos \(movies)")
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
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
 
