//
//  MovieService.swift
//  Cinetopia
//
//  Created by Douglas Silva on 25/02/26.
//

import Foundation

enum MovieServiceError: Error {
    case invalidURL
    case invalidResponse
    case decodeingError
}

struct MovieService {
    func getMovies() async throws -> [Movie]{
        
        let urlString = "http://192.168.10.18:3000/movies"
        guard let url = URL(string: urlString) else {
            throw MovieServiceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MovieServiceError.invalidResponse
        }
        
        do {
            let movies = try JSONDecoder().decode([Movie].self, from: data)
            return movies
        } catch {
            throw MovieServiceError.decodeingError
        }
    }
}
