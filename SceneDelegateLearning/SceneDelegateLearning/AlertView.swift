import SwiftUI

struct AlertViewModifier: ViewModifier {
    @Binding var isPresented: Bool
    var title: String
    var message: String

    func body(content: Content) -> some View {
        content
            .alert(isPresented: $isPresented) {
                Alert(title: Text(title), message: Text(message), dismissButton: .default(Text("OK")))
            }
    }
}

extension View {
    func alertView(isPresented: Binding<Bool>, title: String, message: String) -> some View {
        self.modifier(AlertViewModifier(isPresented: isPresented, title: title, message: message))
    }
}
