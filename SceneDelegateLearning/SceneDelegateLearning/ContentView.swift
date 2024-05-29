import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                Button("Show Toast") {
                    ToastView.show(message: "Coming Soon...")
                }

                Button("Show Progress") {
                    CustomProgressView.show(message: "Loading...")
                }
                
                Button("Show Alert") {
                    AlertView.show(message: "Alert Message", description: "This is a alert")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
