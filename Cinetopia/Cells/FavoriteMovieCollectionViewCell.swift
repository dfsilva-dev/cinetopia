//
//  FavoriteMovieCollectionViewCell.swift
//  Cinetopia
//
//  Created by Douglas Silva on 26/02/26.
//

import UIKit
import Kingfisher

protocol FavoriteMovieCollectionViewCellDelegate: AnyObject {
    func didSelectFavoriteButton(_ sender: UIButton)
}

class FavoriteMovieCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let icon = UIImage(systemName: "heart.fill")?.withTintColor(.buttonBackground, renderingMode: .alwaysOriginal)
        button.setImage(icon, for: .normal)
        button.addTarget(self, action: #selector(didTabFavoriteButton), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: FavoriteMovieCollectionViewCellDelegate?
    
    // MARK: - View life cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Class Methods
    
    private func setupConstraints(){
        addSubview(moviePosterImageView)
        moviePosterImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        moviePosterImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        moviePosterImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        moviePosterImageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        addSubview(movieTitleLabel)
        movieTitleLabel.topAnchor.constraint(equalTo: moviePosterImageView.bottomAnchor, constant: 12).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        addSubview(favoriteButton)
        favoriteButton.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 7).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        favoriteButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
    
    func setupView(_ movie: Movie){
        let url = URL(string: movie.image)
        moviePosterImageView.kf.setImage(with: url)
        movieTitleLabel.text = movie.title
    }
    
    // MARK: - IBAction
    
    @objc
    func didTabFavoriteButton(_ sender: UIButton) {
        delegate?.didSelectFavoriteButton(sender)
    }

}
