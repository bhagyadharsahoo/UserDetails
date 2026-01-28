//
//  UserListView.swift
//  UserDetailsTask
//
//  Created by bhagya sahoo on 28/01/26.
//

import SwiftUI

struct UserListView: View {

    @StateObject private var vm = UserListViewModel()
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            Group {

                if vm.isLoading {
                    ProgressView("Loading users...")
                }
                else if let error = vm.errorMessage {
                    ContentUnavailableView("Error", systemImage: "xmark.circle", description: Text(error))
                }
                else if vm.filteredUsers.isEmpty {
                    ContentUnavailableView("No users found", systemImage: "person.3")
                }
                else {
                    ScrollView {
                        LazyVStack(spacing: 14) {

                            CityFilterView(cities: vm.cities, selectedCity: $vm.selectedCity)

                            ForEach(vm.filteredUsers) { user in
                                UserCardView(user: user)
                                    .onTapGesture {
                                        path.append(user)
                                    }
                            }
                        }
                        .padding()
                    }
                    .refreshable {
                        await vm.fetchUsersData(force: true)
                    }
                }
            }
            .navigationTitle("Users")
            .searchable(text: $vm.searchText)
            .navigationDestination(for: UserDataModelElement.self) { user in
                UserDetailView(user: user)
            }
            .onChange(of: vm.searchText) { _ in vm.applyCityFilters() }
            .onChange(of: vm.selectedCity) { _ in vm.applyCityFilters() }
            .task {
                await vm.fetchUsersData()
            }
        }
    }
}
