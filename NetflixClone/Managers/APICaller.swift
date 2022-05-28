//
//  APICaller.swift
//  NetflixClone
//
//  Created by Jason Dubon on 5/25/22.
//

import Foundation


struct Constants {
    static let API_KEY = "ca3cf81cb54b0161e2a92873159e2ec5"
    static let baseURL = "https://api.themoviedb.org"
    static let YouTubeAPI_KEY = "AIzaSyBQoAAoO_OEzrHSgvcOreP-_OvwA-mqKIU"
    static let YouTubeBaseURL = "https://www.googleapis.com/youtube/v3/search?"
}

enum APIError: Error {
        case failedToGetData
}


class APICaller {
    
    static let shared = APICaller()
    
    // Note Movie uses original title and TV uses original name
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try  JSONDecoder().decode(TrendingTitlesResponse.self, from: data  )
                completion(.success(results.results))
                print(results.results[0].original_title)
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
        
    }
    
    func getTrendingTVs(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try  JSONDecoder().decode(TrendingTitlesResponse.self, from: data  )
                completion(.success(results.results))
                print(results.results[0].original_name)
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
        
    }
    
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try  JSONDecoder().decode(TrendingTitlesResponse.self, from: data  )
                completion(.success(results.results))
                print(results.results[0].original_title)
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
        
    }
    
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try  JSONDecoder().decode(TrendingTitlesResponse.self, from: data  )
                completion(.success(results.results))
                print(results.results[0].original_title)
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
        
    }
    
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/tv/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try  JSONDecoder().decode(TrendingTitlesResponse.self, from: data  )
                completion(.success(results.results))
                print(results.results[0].original_name)
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
        
    }
    
    func getAnime(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/genre/tv/list?api_key=\(Constants.API_KEY)&language=en-US") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try  JSONDecoder().decode(TrendingTitlesResponse.self, from: data  )
                completion(.success(results.results))
                print(results.results)
                //print(results.results[0].original_name)
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
        
    }

    func getDiscover(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.API_KEY)&language=en-US&sort_by=popularity.desc&page=1&include_null_first_air_dates=false&with_watch_monetization_types=flatrate") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try  JSONDecoder().decode(TrendingTitlesResponse.self, from: data  )
                completion(.success(results.results))
                print(results.results)
                //print(results.results[0].original_name)
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
        
    }
    
    func search(with query: String ,completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "\(Constants.baseURL)/3/search/multi?api_key=\(Constants.API_KEY)&language=en-US&query=\(query)&page=1&include_adult=false") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try  JSONDecoder().decode(TrendingTitlesResponse.self, from: data  )
                completion(.success(results.results))
                print(results.results)
                //print(results.results[0].original_name)
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
        
    }

    
    
    func getMovie(with query: String,completion: @escaping (Result<VideoElement, Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "\(Constants.YouTubeBaseURL)q=\(query)&key=\(Constants.YouTubeAPI_KEY)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try  JSONDecoder().decode(YouTubeSearchResponse.self, from: data  )
                completion(.success(results.items[0]))
                //print(results.results)
                //print(results.results[0].original_name)
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
        
        
    }
}
 

