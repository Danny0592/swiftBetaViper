//
//  MovieCellView.swift
//  swiftBetaViper
//
//  Created by daniel ortiz millan on 15/08/24.
//

import Foundation
import UIKit
import Kingfisher

//          SUBVISTAS

class MovieCellView: UITableViewCell {
    let movieImageView: UIImageView = {
        let imagView = UIImageView()
        imagView.contentMode = .scaleAspectFill
        imagView.translatesAutoresizingMaskIntoConstraints = false
        return imagView
        
    }()
    
    let movieName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .black
        label.font = .systemFont(ofSize: 32, weight: .bold, width: .compressed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .regular, width: .standard)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
//                      INICIALIZADORES
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//                      METODO PARA AÑADIR Y POSICIONAR LAS 3 SUBVISTAS
    
    func setupViews() {
        addSubview(movieImageView)
        addSubview(movieName)
        addSubview(movieDescription)
        
        NSLayoutConstraint.activate([
            movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            movieImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            movieImageView.heightAnchor.constraint(equalToConstant: 200),
            movieImageView.widthAnchor.constraint(equalToConstant: 100),
//            movieImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            movieImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -12),
            
            movieName.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 18),
            movieName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            movieName.topAnchor.constraint(equalTo: movieImageView.topAnchor, constant: 24),
            
            movieDescription.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 20),
            movieDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            movieDescription.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 8),
            
            movieDescription.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -12)

            
        ])
    }
    
    
    func configure(model: viewModel) {
        movieImageView.kf.setImage(with: model.imageURL)
        movieName.text = model.title
        movieDescription.text = model.overview
    }
    
}

//class MovieCellView: UITableViewCell {
//    let movieImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//    
//    let movieName: UILabel = {
//        let label = UILabel()
//        label.numberOfLines = 2
//        label.font = .systemFont(ofSize: 32, weight: .bold, width: .condensed)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    let movieDescription: UILabel = {
//        let label = UILabel()
//        label.numberOfLines = 0
//        label.font = .systemFont(ofSize: 12, weight: .regular, width: .standard)
//        label.textColor = .gray
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupViews()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func setupViews() {
//        addSubview(movieImageView)
//        addSubview(movieName)
//        addSubview(movieDescription)
//        
//        NSLayoutConstraint.activate([
//            movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
//            movieImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
//            movieImageView.heightAnchor.constraint(equalToConstant: 200),
//            movieImageView.widthAnchor.constraint(equalToConstant: 100),
//            movieImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            
//            movieName.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 18),
//            movieName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
//            movieName.topAnchor.constraint(equalTo: movieImageView.topAnchor, constant: 24),
//            
//            movieDescription.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 20),
//            movieDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
//            movieDescription.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 8),
//        ])
//    }
//}
