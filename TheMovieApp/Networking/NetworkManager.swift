//
//  NetworkManager.swift
//  TheMovieApp
//
//  Created by Volodymyr Mendyk on 01.03.2021.
//

import Foundation
import Alamofire

final class NetworkManager<T: Codable> {
    static func fetch(from urlString: String, completition: @escaping (Result<T, NetworkError>) -> Void) {
        AF.request(urlString).responseDecodable(of: T.self){
            (resp) in
            if resp.error != nil {
                completition(.failure(.invalidResponse))
                print(resp.error!)
                return
            }
            if let payload = resp.value {
                completition(.success(payload))
                return
            }
            
            completition(.failure(.nilResponse))
        }
    }
}

enum NetworkError: Error {
    case invalidResponse
    case nilResponse
}
