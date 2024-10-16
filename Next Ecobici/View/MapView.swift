//
//  MapView.swift
//  Next Ecobici
//
//  Created by Maul Camlopz on 17/10/24.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let ecobici = CLLocationCoordinate2D(latitude: 19.430515, longitude: -99.203331)
}

struct Annotation: Identifiable {
    let id = UUID()
    var annotation: MKPointAnnotation
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        annotation = MKPointAnnotation()
        annotation.title = title
        annotation.coordinate = coordinate
    }
}

struct MapView: View {
    
    var station: Station
    
    let maxWidthForIpad: CGFloat = 700
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 19.4326077, longitude: -99.133208),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    @State private var annotations: [Annotation] = []
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: annotations) { annotation in
                MapAnnotation(coordinate: annotation.annotation.coordinate) {
                    VStack {
                        Image(systemName: "mappin")
                            .font(.title)
                        Text(annotation.annotation.title ?? "")
                            .font(.callout)
                    }
                }
            }
            VStack(spacing: 0) {
                header
                    .padding()
                    .frame(maxWidth: maxWidthForIpad)
                Spacer()
            }
        }
        .onAppear {
            let annotation = Annotation(title: "", coordinate: CLLocationCoordinate2D(latitude: station.latitude, longitude: station.longitude))
            annotations.append(annotation)
        }
    }
    
}

extension MapView {
    
    private var header: some View {
        VStack {
            Text("\(station.name)")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity)
            Text("Slots: \(station.extra?.slots ?? 0)\nFree bikes: \(station.freeBikes)\nEmpty slots: \(station.emptySlots),")
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
        }
        .padding()
        .background(Color.white.opacity(0.8))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
}

#Preview {
    MapView(station: Station(id: "01", name: "station name", latitude: 19.430515, longitude: -99.203331, freeBikes: 0, emptySlots: 0, extra: Extra(slots: 0)))
}
