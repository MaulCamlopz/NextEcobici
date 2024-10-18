//
//  WebService.swift
//  Next Ecobici
//
//  Created by Maul Camlopz on 17/10/24.
//

import Foundation

final class WebService {
    
    static func getData() async throws -> DataModel {
        let urlString = "https://api.citybik.es/v2/networks/ecobici"
        guard let url = URL(string: urlString) else {
            throw DataError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw DataError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(DataModel.self, from: data)
        } catch {
            throw DataError.invalidData
        }
    }
}

enum DataError: LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidData
    case custom(error: Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
            
        case .invalidResponse:
            return "Invalid Response"
            
        case .invalidData:
            return "Invalid data"
            
        case .custom(let error):
            return error.localizedDescription
        }
    }
}
