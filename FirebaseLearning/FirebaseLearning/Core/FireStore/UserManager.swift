//
//  UserManager.swift
//  FirebaseLearning
//
//  Created by Roro on 07/05/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct DBUser: Codable {
    let userId: String
    let dateCreated: Date?
    let email: String?
    
    init(auth: AuthDataResultModel) {
        self.userId = auth.uid
        self.dateCreated = Date()
        self.email = auth.email
    }
}

final class UserManager {
    static let shared = UserManager()
    private init() {}
    
    private let userCollection = Firestore.firestore().collection("users")
    
    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    private let encoder: Firestore.Encoder = {
        let encoder = Firestore.Encoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
    
    private let decoder: Firestore.Decoder = {
        let decoder = Firestore.Decoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
//    func createNewUser(auth: AuthDataResultModel) async throws {
//        let userData: [String: Any] = [
//            "user_id" : auth.uid,
//            "Date_Created": Timestamp(),
//            "email": auth.email ?? "",
//        ]
//        try await Firestore.firestore().collection("users").document(auth.uid).setData(userData, merge: false)
//    }
    
    func createNewUser(user: DBUser) async throws {
        try userDocument(userId: user.userId).setData(from: user, merge: false, encoder: encoder)
    }
    
    func getUser(userId: String) async throws -> DBUser {
        try await userDocument(userId: userId).getDocument(as: DBUser.self, decoder: decoder)
    }
    
//    func getUser(userId: String) async throws -> DBUser {
//        let snapshot = try await Firestore.firestore().collection("users").document(userId).getDocument()
//        
//        guard let data = snapshot.data(), let userId = data["user_id"] as? String else {
//            throw URLError(.badServerResponse)
//        }
//        
//        let dateCreated = data["Date_Created"] as? Date
//        let email = data["email"] as? String
//        
//        return DBUser(userId: userId, dateCreated: dateCreated, email: email)
//    }
    
    func deleteUser(userId: String) async throws {
        try await userDocument(userId: userId).delete()
    }

}
