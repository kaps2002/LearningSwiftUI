//
//  AddressView.swift
//  MapsLearning
//
//  Created by Roro on 16/05/24.
//

import SwiftUI
import CoreLocation
import MapKit

struct AddressView: View {
    @Binding var addressSheet: Bool
    @Binding var address: String
    @Binding var city: String
    @Binding var state: String
    @Binding var country: String
    @Binding var zip: String
    @Binding var type: String
    let options = ["Home", "Work", "Other"]
    
    @Binding var coordinate: MKCoordinateRegion
    
    @State private var addressTotal: String = ""

    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            Picker("Select an option", selection: $type) {
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        type = option
                    }) {
                        Text(option)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(type == option ? Color.blue : Color.gray.opacity(0.2))
                            .foregroundColor(type == option ? .white : .black)
                            .cornerRadius(8)
                    }
                }
            }
            .pickerStyle(SegmentedPickerStyle())
                    
            TextField("Address", text: $address)
                .padding(.horizontal, 15)
                .frame(height: 45)
                .overlay (
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.5)),
                    alignment: .bottom
                )
            TextField("City", text: $city)
                .padding(.horizontal, 15)
                .frame(height: 45)
                .overlay (
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.5)),
                    alignment: .bottom
                )
            TextField("State", text: $state)
                .padding(.horizontal, 15)
                .frame(height: 45)
                .overlay (
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.5)),
                    alignment: .bottom
                )
            TextField("Country", text: $country)
                .padding(.horizontal, 15)
                .frame(height: 45)
                .overlay (
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.5)),
                    alignment: .bottom
                )
            TextField("Zip", text: $zip)
                .padding(.horizontal, 15)
                .frame(height: 45)
                .overlay (
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.5)),
                    alignment: .bottom
                )
            Spacer()
            Button {
                addressTotal = address + city + state + country + zip
                saveAddress(addressTotal: addressTotal)
                addressSheet = false
                
            } label: {
                Text("Save")
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 45)
                    .foregroundColor(.white)
                    .background(.blue)
                    .clipShape(Capsule())
            }
        }
        .padding(.horizontal, 15)
        .navigationTitle("Edit Address")
        .navigationBarTitleDisplayMode(.automatic)
        .toolbar(content: {
            ToolbarItem {
                Button {
                    addressSheet = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 10)
            }
        })
    }
    
    private func saveAddress(addressTotal: String) {
        // Geocode the address to get coordinates
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressTotal) { placemarks, error in
            if let placemarks = placemarks, let location = placemarks.first?.location {
                coordinate.center = location.coordinate
            }
        }
    }
    
}

#Preview {
    NavigationStack {
        AddressView(addressSheet: .constant(true), address: .constant(""), city: .constant(""), state: .constant(""), country: .constant(""), zip: .constant(""), type: .constant(""), coordinate: .constant(MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Default location
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )))
    }
}
