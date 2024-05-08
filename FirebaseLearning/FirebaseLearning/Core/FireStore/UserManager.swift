//
//  UserManager.swift
//  FirebaseLearning
//
//  Created by Roro on 07/05/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct DBUser {
    let userId: String
    let dateCreated: Date?
    let email: String?
}

final class UserManager {
    static let shared = UserManager()
    private init() {}
    
    func createNewUser(auth: AuthDataResultModel) async throws {
        let userData: [String: Any] = [
            "user_id" : auth.uid,
            "Date_Created": Timestamp(),
            "email": auth.email ?? "",
        ]
        try await Firestore.firestore().collection("users").document(auth.uid).setData(userData, merge: false)
    }
    
    func getUser(userId: String) async throws -> DBUser {
        let snapshot = try await Firestore.firestore().collection("users").document(userId).getDocument()
        
        guard let data = snapshot.data(), let userId = data["user_id"] as? String else {
            throw URLError(.badServerResponse)
        }
        
        let dateCreated = data["Date_Created"] as? Date
        let email = data["email"] as? String
        
        return DBUser(userId: userId, dateCreated: dateCreated, email: email)
    }

}
