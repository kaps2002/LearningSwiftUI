//
//  ContentView.swift
//  MapsLearning
//
//  Created by Roro on 16/05/24.
//

import SwiftUI
import MapKit
import CoreLocation

struct Location: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}
struct ContentView: View {

    @State private var addressSheet = false
    @State private var address: String = ""
    @State private var city: String = ""
    @State private var state: String = ""
    @State private var country: String = ""
    @State private var zip: String = ""
    @State private var type:String  = "Home"

    let locationManager = CLLocationManager()
        
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Default location
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var pinLocation = Location(coordinate: CLLocationCoordinate2D(latitude: 37.334900, longitude: -122.009020))

    var body: some View {
        VStack {
            ZStack {
                Map(coordinateRegion: $region, annotationItems: [pinLocation]) { location in
                    MapMarker(coordinate: pinLocation.coordinate)
                        
                }
                .onChange(of: region.center) { _ in
                    updateAddress(from: region.center)
                }
                .edgesIgnoringSafeArea(.all)
                            
                VStack {
                    Spacer()
                    Button("Use Precise Location") {
                        handleLocationRequest()
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
                                Text(type)
                                Text("\(address) \(city) \(state) \(country) \(zip)")
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
                    AddressView(addressSheet: $addressSheet, address: $address, city: $city, state: $state, country: $country, zip: $zip, type: $type, coordinate: $region)
                }
            })
        }
        .onAppear {
            updateAddress(from: region.center)
        }
    }
    private func convertPointToCoordinate(point: CGPoint, in region: MKCoordinateRegion) -> CLLocationCoordinate2D {
        let mapPoint = MKMapPoint(x: Double(point.x), y: Double(point.y))
        return mapPoint.coordinate
    }
    private func updateAddress(from coordinate: CLLocationCoordinate2D) {
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                print("Reverse geocode failed: \(error.localizedDescription)")
                return
            }
            
            guard let placemark = placemarks?.first else { return }
            
            DispatchQueue.main.async {
                self.address = placemark.thoroughfare ?? ""
                self.city = placemark.locality ?? ""
                self.state = placemark.administrativeArea ?? ""
                self.country = placemark.country ?? ""
                self.zip = placemark.postalCode ?? ""
            }
        }
    }
    
    func requestUserLocation() {
        locationManager.requestLocation()
    }
    
    func handleLocationRequest() {
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            requestUserLocation()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            // Show alert or prompt user to enable location services in settings
            print("Location services denied or restricted.")
        @unknown default:
            break
        }
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()

    @Published var authorizationStatus: CLAuthorizationStatus
    @Binding var region: MKCoordinateRegion

    init(region: Binding<MKCoordinateRegion>) {
        self._region = region
        self.authorizationStatus = CLLocationManager.authorizationStatus()
        super.init()
        locationManager.delegate = self
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }

    func requestWhenInUseAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }

    func requestLocation() {
        locationManager.requestLocation()
    }

    // CLLocationManagerDelegate method
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            DispatchQueue.main.async {
                self.region = MKCoordinateRegion(
                    center: location.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
                )
            }
        }
    }
}

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}


#Preview {
    ContentView()
}
