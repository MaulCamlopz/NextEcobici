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
    let stations: [Station]

    enum CodingKeys: String, CodingKey {
        case id, name, location
        case stations
    }
}

// MARK: - Location
struct Location: Codable {
    let latitude, longitude: Double
    let city, country: String
}

// MARK: - Station
struct Station: Codable, Identifiable {
    let id, name: String
    let latitude, longitude: Double
    let freeBikes, emptySlots: Int
    let extra: Extra?

    enum CodingKeys: String, CodingKey {
        case id, name, latitude, longitude
        case freeBikes = "free_bikes"
        case emptySlots = "empty_slots"
        case extra
    }
}

// MARK: - Extra
struct Extra: Codable {
    let slots: Int

    enum CodingKeys: String, CodingKey {
        case slots
    }
}
