//
//  HomeView.swift
//  Next Ecobici
//
//  Created by Maul Camlopz on 16/10/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @ObservedObject var dataViewModel = DataViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                List(dataViewModel.stations ?? [], id: \.id) { station in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(station.name.capitalized)
                                .font(.headline)
                            Text("Free Bikes:\(station.freeBikes)")
                                .font(.subheadline)
                            Text("Empty Slots:\(station.emptySlots)")
                                .font(.subheadline)
                        }
                    }
                }
                .listStyle(.plain)
                .listRowInsets(EdgeInsets())
                .background(Color.white)
                .navigationTitle("Ecobici stations")
                if dataViewModel.isLoading {
                    LoaderView()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Logout") {
                    authenticationViewModel.logout()
                }
            }
        }
        .onAppear {
            Task {
                await dataViewModel.getStations()
            }
        }
        .alert(isPresented: $dataViewModel.shouldShowAlert) {
            return Alert(
                title: Text("Error"),
                message: Text(dataViewModel.dataError?.errorDescription ?? "")
            )
        }
        
    }
    
}

#Preview {
    HomeView(authenticationViewModel: AuthenticationViewModel())
}
