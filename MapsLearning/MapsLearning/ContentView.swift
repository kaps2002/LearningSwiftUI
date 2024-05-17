//
//  ContentView.swift
//  MapsLearning
//
//  Created by Roro on 16/05/24.
//

import SwiftUI
import MapKit
import CoreLocation

struct ContentView: View {

    @State private var addressSheet = false
    @State private var address: String = ""
    @State private var city: String = ""
    @State private var state: String = ""
    @State private var country: String = ""
    @State private var zip: String = ""

    let locationManager = CLLocationManager()
        
    @State var region = MKCoordinateRegion(
        center: .init(latitude: 37.334_900,longitude: -122.009_020),
        span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        VStack {
            ZStack {
                Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                            .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    Button("Use Precise Location") {
                        locationManager.requestWhenInUseAuthorization()
                    }
                    .padding(10)
                    .background(.white)
                    .cornerRadius(5.0)
                }
                .padding(.bottom, 10)
                
            }

            VStack(spacing: 15) {
                VStack {
                    HStack {
                        HStack(spacing: 10) {
                            Image(systemName: "mappin")
                                .imageScale(.large)
                            VStack(alignment: .leading) {
                                Text("Home")
                                Text("\(address), \(city), \(state), \(country), \(zip)")
                            }
                        }
                        
                        Spacer()
                        Button {
                            addressSheet = true
                        } label: {
                            Text("Edit")
                                .font(.headline)
                                .frame(width: 60, height: 25)
                        }
                        .padding(5)
                        .cornerRadius(10.0)
                        
                    }
                    .padding(.horizontal, 15)
                    
                    Button {
                        
                    } label: {
                        Text("Get Directions")
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 45)
                            .foregroundColor(.white)
                            .background(.blue)
                            .clipShape(Capsule())
                    }
                    .padding(.horizontal, 15)
                }
                .background()
            }
            .ignoresSafeArea()
            .sheet(isPresented: $addressSheet, content: {
                NavigationStack {
                    AddressView(addressSheet: $addressSheet, address: $address, city: $city, state: $state, country: $country, zip: $zip)
                }
            })
        }
    }
}


#Preview {
    ContentView()
}
