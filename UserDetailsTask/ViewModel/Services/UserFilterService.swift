//
//  UserFilterService.swift
//  UserDetailsTask
//
//  Created by bhagya sahoo on 28/01/26.
//


struct UserFilterService: UserFilterServiceProtocol {

    func filter(
        users: [UserDataModelElement],
        searchText: String,
        city: String?
    ) -> [UserDataModelElement] {

        var temp = users

        if let city = city {
            temp = temp.filter { $0.address?.city == city }
        }

        if !searchText.isEmpty {
            let key = searchText.lowercased()
            temp = temp.filter {
                $0.name?.lowercased().contains(key) ?? false ||
                $0.username?.lowercased().contains(key) ?? false
            }
        }

        return temp
    }
}
