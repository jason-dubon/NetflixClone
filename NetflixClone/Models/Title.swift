//
//  Movie.swift
//  NetflixClone
//
//  Created by Jason Dubon on 5/25/22.
//

import Foundation

struct TrendingTitlesResponse: Codable {
    
    let results: [Title]
    
    
    
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
    
    
}
