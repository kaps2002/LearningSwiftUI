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
        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    )
    @State private var pinLocation = Location(coordinate: CLLocationCoordinate2D(latitude: 37.334900, longitude: -122.009020))


    var body: some View {
        VStack {
            ZStack {
                Map(coordinateRegion: $region, annotationItems: [pinLocation]) { location in
                    MapMarker(coordinate: location.coordinate)
                }
                .onChange(of: region.center) { _, newCenter in
                    updateAddress(from: newCenter)
                    updatePinLocation(to: newCenter)
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
                        getDirections(to: address + state + city + country + zip)
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
        .onChange(of: locationManager.authorizationStatus) { status in
            if status == .authorizedWhenInUse || status == .authorizedAlways {
                locationManager.requestLocation()
            }
        }
    }
    
    private func updatePinLocation(to newCenter: CLLocationCoordinate2D) {
        pinLocation = Location(coordinate: newCenter)
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
    
    func getDirections(to address: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { placemarks, error in
            if let error = error {
                print("Geocoding error: \(error.localizedDescription)")
                return
            }
            
            guard let placemark = placemarks?.first, let location = placemark.location else {
                print("No matching location found")
                return
            }
            
            let destinationCoordinates = location.coordinate
            let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinates)
            let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
            destinationMapItem.name = address // Optional: Name for the destination
            
            let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
            destinationMapItem.openInMaps(launchOptions: launchOptions)
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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            DispatchQueue.main.async {
                self.region.center = location.coordinate
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error.localizedDescription)")
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
