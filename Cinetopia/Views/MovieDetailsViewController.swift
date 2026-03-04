//
//  MovieDetailsViewController.swift
//  Cinetopia
//
//  Created by Douglas Silva on 24/02/26.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: UIViewController {
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 34, weight: .bold)
        return label
    }()
    
    private lazy var moviePosterImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 32
        image.layer.masksToBounds = true
        return image
    }()
    
    private lazy var movieRateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var movieSysnopisLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        addSubviews()
        setupConstriants()
        loadContent()
    }
    
    private func loadContent(){
        movieTitleLabel.text = movie.title
        let url = URL(string: movie.image)
        moviePosterImageView.kf.setImage(with: url)
        movieRateLabel.text = "Classificação dos usuários: \(movie.rate)"
        movieSysnopisLabel.text = movie.synopsis
    }
    
    private func addSubviews(){
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(movieTitleLabel)
        contentView.addSubview(moviePosterImageView)
        contentView.addSubview(movieRateLabel)
        contentView.addSubview(movieSysnopisLabel)
    }
    
    private func setupConstriants(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            movieTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            movieTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            moviePosterImageView.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 32),
            moviePosterImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            moviePosterImageView.heightAnchor.constraint(equalToConstant: 300),
            moviePosterImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            movieRateLabel.topAnchor.constraint(equalTo: moviePosterImageView.bottomAnchor, constant: 24),
            movieRateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            movieSysnopisLabel.topAnchor.constraint(equalTo: movieRateLabel.bottomAnchor, constant: 24),
            movieSysnopisLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            movieSysnopisLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            movieSysnopisLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}

/*#Preview{
    MovieDetailsViewController(movie: mockMovie[0])
}*/
