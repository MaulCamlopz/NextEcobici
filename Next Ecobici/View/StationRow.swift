//
//  StationRow.swift
//  Next Ecobici
//
//  Created by Maul Camlopz on 17/10/24.
//

import SwiftUI

struct StationRow: View {
    var station: Station
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(station.name.capitalized)
                .font(.headline)
            Text("Free Bikes: \(station.freeBikes)")
                .font(.subheadline)
            Text("Empty Slots: \(station.emptySlots)")
                .font(.subheadline)
        })
    }
}

#Preview {
    StationRow(station: Station(id: "01", name: "name", latitude: 0.0, longitude: 0.0, freeBikes: 0, emptySlots: 0, extra: Extra(slots: 0)))
}
