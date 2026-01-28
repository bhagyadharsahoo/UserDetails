//
//  UserServiceProtocol.swift
//  UserDetailsTask
//
//  Created by bhagya sahoo on 28/01/26.
//

protocol UserServiceProtocol {
    func fetchUsers() async throws -> UserDataModel
}
