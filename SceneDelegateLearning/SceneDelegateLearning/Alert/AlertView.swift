import SwiftUI

struct AlertView: View {
    @State var showAlert = false
    @State var alertMessage: String = ""
    @State var description: String = ""
    @State var isLogOut = false
    @State var showSignInButton = false
    
    var body: some View {
        ZStack {}
            .alertView(isShowing: $showAlert, title: alertMessage, message: description, isLogOut: $isLogOut)
            .onReceive(NotificationCenter.default.publisher(for: .showAlert)) { data in
                guard let userInfo = data.userInfo, let message = userInfo[NotificationData.alertMessage], let desc = userInfo[NotificationData.alertDesc] else {
                    showAlert = false
                    return
                }
                self.alertMessage = message as! String
                self.description = desc as! String
                showAlert = true
            }
            .onChange(of: isLogOut) { newValue, _ in
                if newValue {
                    showAlert = false
                    showSignInButton = true
                }
            }
        if showSignInButton {
            Button("Sign In") {
                // Action for Sign In button
            }
        }
    }
    
    static func show(message: String, description: String) {
        NotificationCenter.default.post(name: .showAlert, object: nil, userInfo: [NotificationData.alertMessage: message, NotificationData.alertDesc: description])
    }
}

extension View {
    func alertView(isShowing: Binding<Bool>, title: String, message: String, isLogOut: Binding<Bool>) -> some View {
        self.modifier(CustomAlert(message: title, desc: message, isShowing: isShowing, isLogOut: isLogOut))
    }
}
