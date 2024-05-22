import SwiftUI

struct ContentView: View {
    @State private var showToast = false
    @State private var showProgress = false
    @State private var showAlert = false

    var body: some View {
        ZStack {
            VStack {
                Button("Show Toast") {
                    ToastView.show(message: "Coming Soon...")
                }

                Button("Show Progress") {
                    CustomProgressView.show(message: "Loading...")
                }

//                Button("Show Alert") {
//                    showAlert.toggle()
//                }
            }
        }
        .alertView(isPresented: $showAlert, title: "Alert", message: "This is an alert message")
    }
}



