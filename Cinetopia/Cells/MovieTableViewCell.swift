//
//  MovieTableViewCell.swift
//  Cinetopia
//
//  Created by Douglas Silva on 24/02/26.
//

import UIKit
import Kingfisher

protocol MovieTableViewCellDelegate: AnyObject {
    func didSelectFavoriteButton(sender: UIButton)
}

class MovieTableViewCell: UITableViewCell {
    
    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var movieReleaseDate: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white.withAlphaComponent(0.75)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let icon = UIImage(systemName: "heart")?.withTintColor(.buttonBackground, renderingMode: .alwaysOriginal)
        button.setImage(icon, for: .normal)
        button.addTarget(self, action: #selector(didTabFavoriteButton), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: MovieTableViewCellDelegate?
    
    func configureCell(movie: Movie){
        movieTitleLabel.text = movie.title
        let url = URL(string: movie.image)
        moviePosterImageView.kf.setImage(with: url)
        movieReleaseDate.text = "Lançamento: \(movie.releaseDate)"
        
        let heart = UIImage(systemName: "heart")?.withTintColor(.buttonBackground, renderingMode: .alwaysOriginal)
        let heartFill = UIImage(systemName: "heart.fill")?.withTintColor(.buttonBackground, renderingMode: .alwaysOriginal)
        
        if movie.isSelected ?? false {
            favoriteButton.setImage(heartFill, for: .normal)
        } else {
            favoriteButton.setImage(heart, for: .normal)
        }
    }
    
    private func addSubviews(){
        addSubview(moviePosterImageView)
        addSubview(movieTitleLabel)
        addSubview(movieReleaseDate)
        contentView.addSubview(favoriteButton)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            moviePosterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            moviePosterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            moviePosterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            moviePosterImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4),
            movieTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -16),
            movieTitleLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor),
            movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            movieReleaseDate.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 8),
            movieReleaseDate.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor),
            movieReleaseDate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            favoriteButton.topAnchor.constraint(equalTo: movieReleaseDate.bottomAnchor, constant: 8),
            favoriteButton.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 16),
            favoriteButton.heightAnchor.constraint(equalToConstant: 25),
            favoriteButton.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        backgroundColor = .background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Actions
    
    @objc
    func didTabFavoriteButton(sender: UIButton){
        delegate?.didSelectFavoriteButton(sender: sender)
    }

}

#Preview{
    MovieTableViewCell()
}
