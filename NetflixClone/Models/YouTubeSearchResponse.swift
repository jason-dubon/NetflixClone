//
//  YouTubeSearchResponse.swift
//  NetflixClone
//
//  Created by Jason Dubon on 5/26/22.
//

import Foundation


struct YouTubeSearchResponse: Codable {
    
    let items: [VideoElement]
    
    
}


struct VideoElement: Codable {
    let id: IDElement
    
}

struct IDElement: Codable {
    let kind: String
    let videoId: String
    
}
