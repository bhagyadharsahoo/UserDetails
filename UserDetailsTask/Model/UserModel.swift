//
//  UserDataModelElement.swift
//  UserDetailsTask
//
//  Created by bhagya sahoo on 27/01/26.
//

import Foundation

// MARK: - UserDataModelElement
struct UserDataModelElement: Codable, Sendable, Identifiable, Hashable {
    var id: Int?
    var name, username, email: String?
    var address: Address?
    var phone, website: String?
    var company: Company?
}

// MARK: - Address
struct Address: Codable, Sendable, Hashable {
    var street, suite, city, zipcode: String?
    var geo: Geo?
}

// MARK: - Geo
struct Geo: Codable, Sendable, Hashable {
    var lat, lng: String?
}

// MARK: - Company
struct Company: Codable, Sendable, Hashable {
    var name, catchPhrase, bs: String?
}

typealias UserDataModel = [UserDataModelElement]

