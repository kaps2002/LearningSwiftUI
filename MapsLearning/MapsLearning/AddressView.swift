//
//  AddressView.swift
//  MapsLearning
//
//  Created by Roro on 16/05/24.
//

import SwiftUI

struct AddressView: View {
    @Binding var addressSheet: Bool
    @Binding var address: String
    @Binding var city: String
    @Binding var state: String
    @Binding var country: String
    @Binding var zip: String

    var body: some View {
        
        VStack(spacing: 20) {
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
    
}

#Preview {
    NavigationStack {
        AddressView(addressSheet: .constant(true), address: .constant(""), city: .constant(""), state: .constant(""), country: .constant(""), zip: .constant(""))
    }
}
