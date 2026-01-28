//
//  UserDetailView.swift
//  UserDetailsTask
//
//  Created by bhagya sahoo on 28/01/26.
//


import SwiftUI

struct UserDetailView: View {

    let user: UserDataModelElement

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                GroupBox("Contact") {
                    Text(user.email ?? "")
                    Text(user.phone ?? "")
                }

                GroupBox("Address") {
                    Text("\(user.address?.street ?? ""), \(user.address?.suite ?? "")")
                    Text(user.address?.city ?? "")
                    Text("Zip: \(user.address?.zipcode ?? "")")
                    Text("Lat: \(user.address?.geo?.lat ?? "")")
                    Text("Lng: \(user.address?.geo?.lng ?? "")")
                }

                GroupBox("Company") {
                    Text(user.company?.name ?? "").bold()
                    Text(user.company?.catchPhrase ??
                    "").italic()
                    Text(user.company?.bs ?? "")
                }
            }
            .padding()
        }
        .navigationTitle(user.name ?? "")
    }
}
