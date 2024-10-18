//
//  EcobiciAPIModel.swift
//  Next Ecobici
//
//  Created by Maul Camlopz on 17/10/24.
//

import Foundation



// MARK: - DataModel
struct DataModel: Codable {
    let network: Network
}

// MARK: - Network
struct Network: Codable {
    let id, name: String
    let location: Location
    let href: String
    let company: [String]
    let gbfsHref: String
    let stations: [Station]

    enum CodingKeys: String, CodingKey {
        case id, name, location, href, company
        case gbfsHref = "gbfs_href"
        case stations
    }
}

// MARK: - Location
struct Location: Codable {
    let latitude, longitude: Double
    let city, country: String
}

// MARK: - Station
struct Station: Codable {
    let id, name: String
    let latitude, longitude: Double
    let timestamp: String
    let freeBikes, emptySlots: Int
    let extra: Extra

    enum CodingKeys: String, CodingKey {
        case id, name, latitude, longitude, timestamp
        case freeBikes = "free_bikes"
        case emptySlots = "empty_slots"
        case extra
    }
}

// MARK: - Extra
struct Extra: Codable {
    let uid: String
    let renting, returning, lastUpdated: Int
    let payment: [String]
    let paymentTerminal: Bool
    let slots: Int

    enum CodingKeys: String, CodingKey {
        case uid, renting, returning
        case lastUpdated = "last_updated"
        case payment
        case paymentTerminal = "payment-terminal"
        case slots
    }
}
