//
//  DataViewModel.swift
//  Next Ecobici
//
//  Created by Maul Camlopz on 17/10/24.
//

import Foundation

@MainActor
final class DataViewModel: ObservableObject {
    
    @Published var data: DataModel?
    @Published var stations: [Station]?
    @Published var dataError: DataError?
    @Published var shouldShowAlert = false
    @Published var isLoading = false
    
    func getStations() async {
        print("Init getStations")
        isLoading = true
        do {
            self.data = try await WebService.getData()
            self.stations = data?.network.stations
            print(stations ?? "stations")
            self.isLoading = false
        } catch(let error) {
            print(error.localizedDescription)
            dataError = DataError.custom(error: error)
            shouldShowAlert = true
            isLoading = false
        }
    }
}
