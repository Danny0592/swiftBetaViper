//
//  MovieCellView.swift
//  swiftBetaViper
//
//  Created by daniel ortiz millan on 15/08/24.
//

import Foundation
import UIKit

class MovieCellView: UITableView {
    let movieImageView: UIImageView = {
        let imagView = UIImageView()
        imagView.contentMode = .scaleAspectFill
        imagView.translatesAutoresizingMaskIntoConstraints = false
        return imagView
        
    }()
    let movieName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 32, weight: .bold, width: .compressed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieDescriotion: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .regular, width: .standard)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
}
