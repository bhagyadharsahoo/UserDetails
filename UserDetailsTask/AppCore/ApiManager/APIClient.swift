//
//  ApiManager.swift
//  UserDetailsTask
//
//  Created by bhagya sahoo on 27/01/26.
//
import Foundation

actor ApiManager: UserServiceProtocol {

    static let shared = ApiManager()

    func fetchUsers() async throws -> UserDataModel {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            throw APIError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw APIError.badResponse
        }

        do {
            return try JSONDecoder().decode(UserDataModel.self, from: data)
        } catch {
            throw APIError.decodingError
        }
    }
}
