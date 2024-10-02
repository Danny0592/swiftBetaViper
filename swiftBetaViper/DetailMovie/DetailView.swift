//
//  DetailView.swift
//  swiftBetaViper
//
//  Created by daniel ortiz millan on 10/09/24.
//

import Foundation
import UIKit

class DetailView: UIViewController {
    private let presenter: DetailPresentable
    
    
    let movieImageView: UIImageView = {
        let imageView =  UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints
        return imageView
    }()
    
    let movieName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 32, weight: .bold, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieDEscription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 32, weight: .bold, width: .standard)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
    init(presenter: DetailPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        presenter.onViewAppear()
    }
    
    func setupViews() {
        view.addSubview(movieImageView)
        view.addSubview(movieName)
        view.addSubview(movieDEscription)
        
        NSLayoutConstraint.activate([
            movieImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            movieImageView.heightAnchor.constraint(equalToConstant: 200),
            movieImageView.widthAnchor.constraint(equalToConstant: 300),
            
            movieName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            movieName.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 20),
            
            movieDEscription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieDEscription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            movieDEscription.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 20),
        ])
    }
}

extension DetailView: DetailPresenterUI {
    func updateUI(viewModel: DetailMovieViewModel) {
        movieImageView.kf.setImage(with: viewModel.backdropPath)
        movieName.text = viewModel.title
        movieDEscription.text = viewModel.overview
    }
}
