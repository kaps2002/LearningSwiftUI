import SwiftUI

struct ContentView: View {
    @State private var offset = CGSize.zero
    @State private var isDragging = false

    var body: some View {
        ZStack {
            // Main content
            Color.green.edgesIgnoringSafeArea(.all)
            
            // ZStack to overlay the layers
            ZStack {
                VStack {
                    Spacer()
                    Text("Drag Me!")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .offset(offset) // Apply the offset to move the VStack

                // Gesture to handle dragging
                Rectangle()
                    .foregroundColor(.clear)
                    .contentShape(Rectangle())
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                self.offset = gesture.translation
                                self.isDragging = true
                            }
                            .onEnded { _ in
                                self.isDragging = false
                                // Optionally handle other logic when dragging ends
                            }
                    )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
