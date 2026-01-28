//
//  UserListViewModel.swift
//  UserDetailsTask
//
//  Created by bhagya sahoo on 28/01/26.
//


import Foundation
import Combine



@MainActor
final class UserListViewModel: ObservableObject {
    
    @Published private(set) var users: UserDataModel = []
    @Published var filteredUsers: UserDataModel = []
    
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    @Published var searchText = ""
    @Published var selectedCity: String?
    
    private var hasLoaded = false
    
    private let service: UserServiceProtocol
    private let filteraService: UserFilterServiceProtocol
    
    init(service: UserServiceProtocol = ApiManager.shared,
         filterService: UserFilterServiceProtocol = UserFilterService()) {
        self.service = service
        self.filteraService = filterService
    }

    func fetchUsersData(force: Bool = false) async {
        if hasLoaded && !force { return }

        isLoading = true
        errorMessage = nil

        do {
            let result = try await service.fetchUsers()
            users = result
            applyCityFilters()
            hasLoaded = true
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }

    func applyCityFilters() {
        filteredUsers = filteraService.filter(users: users,
                                              searchText: searchText,
                                              city: selectedCity)
    }

    var cities: [String?] {
        Array(Set(users.map({$0.address?.city ?? ""}))).sorted()
    }
}
