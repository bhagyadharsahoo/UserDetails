//
//  CityFilterView.swift
//  UserDetailsTask
//
//  Created by bhagya sahoo on 28/01/26.
//


import SwiftUI

struct CityFilterView: View {

    let cities: [String?]
    @Binding var selectedCity: String?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Button("All") {
                    selectedCity = nil
                }
                .chipStyle(isSelected: selectedCity == nil)

                ForEach(cities, id: \.self) { city in
                    Button(city ?? "") {
                        selectedCity = city
                    }
                    .chipStyle(isSelected: selectedCity == city)
                }
            }
            .padding(.horizontal)
        }
    }
}

private extension View {
    func chipStyle(isSelected: Bool) -> some View {
        self.padding(.horizontal, 14)
            .padding(.vertical, 6)
            .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
            .foregroundColor(isSelected ? .white : .primary)
            .clipShape(Capsule())
    }
}
