//
//  MapKit.swift
//  Landmarks
//
//  Created by Roro on 16/03/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var landmark: Landmark
    var body: some View {
        Map(initialPosition: .region(region))
    }
    private var region: MKCoordinateRegion {
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: landmark.locationCoordinate.latitude, longitude: landmark.locationCoordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
        }
}

#Preview {
    MapView(landmark: ModelData().landmarks[0])
}
