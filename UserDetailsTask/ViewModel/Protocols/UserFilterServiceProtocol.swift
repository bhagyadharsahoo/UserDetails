//
//  UserFilterServiceProtocol.swift
//  UserDetailsTask
//
//  Created by bhagya sahoo on 28/01/26.
//


protocol UserFilterServiceProtocol {
    func filter(
        users: [UserDataModelElement],
        searchText: String,
        city: String?
    ) -> [UserDataModelElement]
}
