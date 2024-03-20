import SwiftUI

struct ContentView: View {
    @State private var offsetY: CGFloat = UIScreen.main.bounds.height / 2 // Initially, set the offset to make the sheet half-visible at the bottom
    @State private var isSheetOpen = false // State to control the visibility of the sheet
    
    var body: some View {
        ZStack {
            // Main content
            Color.green.edgesIgnoringSafeArea(.all)
            
            // Bottom sheet
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 50, height: 5)
                        .foregroundColor(.red)
                        .padding(.top, 10)
                        .gesture(DragGesture()
                            .onChanged({ value in
                                let newOffsetY = self.offsetY + value.translation.height
                                self.offsetY = max(min(newOffsetY, geometry.size.height), geometry.size.height / 2) // Limit the movement within the bottom half of the screen
                            })
                                .onEnded({ value in
                                    let midPoint = geometry.size.height * 0.75 // Adjust this value to set the threshold for automatically opening/closing the sheet
                                    withAnimation {
                                        if self.offsetY > midPoint {
                                            self.isSheetOpen = false
                                            self.offsetY = geometry.size.height / 2
                                        } else {
                                            self.isSheetOpen = true
                                            self.offsetY = geometry.size.height
                                        }
                                    }
                                }))
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .offset(y: self.offsetY) // Apply the offsetY to move the sheet up and down
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
