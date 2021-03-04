//
//  Review.swift
//  TheMovieApp
//
//  Created by Volodymyr Mendyk on 01.03.2021.
//

import Foundation


struct ReviewResponse: Codable {
    var results: [Review]
}


struct Review: Codable, Identifiable {
    var id: Int?
    var author: String?
    var content: String?

}
