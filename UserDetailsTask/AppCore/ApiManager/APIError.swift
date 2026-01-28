//
//  APIError.swift
//  UserDetailsTask
//
//  Created by bhagya sahoo on 27/01/26.
//
import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case badResponse
    case decodingError

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .badResponse: return "Bad server response"
        case .decodingError: return "Failed to decode data"
        }
    }
}
