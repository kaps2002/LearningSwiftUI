import SwiftUI

struct ContentView: View {
    @State private var showToast = false
    @State private var showProgress = false
    @State private var showAlert = false

    var body: some View {
        ZStack {
            VStack {
                Button("Show Toast") {
                    withAnimation {
                        showToast.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            showToast = false
                        }
                    }
                }

                Button("Show Progress") {
                    showProgress.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        showProgress = false
                    }
                }

                Button("Show Alert") {
                    showAlert.toggle()
                }
            }
            
            if showToast {
                VStack {
                    Spacer()
                    ToastView(message: "This is a toast message")
                        .transition(.move(edge: .bottom))
                }
            }
            
            if showProgress {
                CustomProgressView()
            }
        }
        .alertView(isPresented: $showAlert, title: "Alert", message: "This is an alert message")
    }
}

struct ToastView: View {
    var message: String

    var body: some View {
        Text(message)
            .foregroundColor(.black)
            .padding()
            .background(Color.gray.opacity(0.4))
            .cornerRadius(10)
            .padding(.bottom, 20)
    }
}

struct CustomProgressView: View {
    var body: some View {
        VStack {
            Spacer()
            ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
        }
    }
}

