//
//  Movie.swift
//  Cinetopia
//
//  Created by Douglas Silva on 24/02/26.
//

import Foundation

class Movie: Codable {
    let id: Int
    let title: String
    let image: String
    let synopsis: String
    let rate: Double
    let releaseDate: String
    private(set) var isSelected: Bool? = false
    
    // MARK: - Class methods
    
    func changeSelectionStatus(){
        isSelected = !(isSelected ?? false)
    }
    
    enum CodingKeys: String, CodingKey{
        case id = "code"
        case title
        case image
        case synopsis
        case rate
        case releaseDate
        case isSelected
    }
}

/*let mockMovie: [Movie] = [
    Movie(id: 1, title: "Call me Chihiro", image: "https://m.media-amazon.com/images/M/MV5BNDQxNmVhMWMtYjg5OC00N2QzLWExMTQtMDcxYmNiMWI0NzIzXkEyXkFqcGc@._V1_.jpg", synopsis: "Chihiro used to work as a prostitute. She happened to stop by a seaside town and have a bento meal there. She loved the meal so much, she decided to settle down in the seaside town and work at the bento shop. She now greets customers with a smile at the bento shop and makes small talk with them. She doesn't even hide her past. Chihiro talks with customers about various problems and, through their conversations, they are comforted by her. Chihiro herself suffers from loneliness, which started with her family when she was little. By meeting her customers, she also faces her loneliness and gets over that slowly.", rate: 7.7, releaseDate: "23/02/2023"),
    Movie(id: 2, title: "Drawing Closer", image: "https://m.media-amazon.com/images/M/MV5BZDdhODE4NTAtNDc0NS00ZTk1LTk3Y2YtNTE4ODZjMDQ1NjZiXkEyXkFqcGc@._V1_.jpg", synopsis: "Hayasaka Akito is a talented artist. He is working hard to be accepted for the Nika Exhibition, but a tumor is discovered in his heart, and he is told that he has one year left to live. Hayasaka Akito doesn't express his emotions on his diagnosis. One day, on the hospital rooftop, Hayasaka Akito meets Sakurai Haruna, who is painting. Sakurai Haruna tells him that she has only half a year to live. Hayasaka Akito gets attracted to her more and more, but he doesn't tell her about his condition.", rate: 8.9, releaseDate: "27/06/2024"),
    Movie(id: 3, title: "Hear me: Our Summer", image: "https://image.tmdb.org/t/p/original/dNCp17yK9L0pANvKTb6tWECQj4Q.jpg", synopsis: "Yong Jun works part-time at his parents' lunch box house. Yeo Reum lives only to support a hearing-impaired swimmer sister. One day, Yong Jun meets Yeo Reum while delivering lunch boxes and falls in love at first sight. Yeo Reum slowly opens her heart to warm-hearted Yong Jun.", rate: 8.4, releaseDate: "03/10/2024")
]*/
