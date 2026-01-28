//
//  UserCardView.swift
//  UserDetailsTask
//
//  Created by bhagya sahoo on 28/01/26.
//


import SwiftUI

struct UserCardView: View {

    let user: UserDataModelElement

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            HStack {
                Text(user.name ?? "")
                    .font(.headline)

                Spacer()

                Text(user.address?.city ?? "")
                    .font(.caption)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.blue.opacity(0.15))
                    .clipShape(Capsule())
            }

            Text("@\(user.username ?? "")").foregroundColor(.secondary)
            Text(user.email ?? "")
            Text(user.phone ?? "")

            Text(user.company?.name ?? "")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemBackground)))
        .shadow(radius: 2)
    }
}
