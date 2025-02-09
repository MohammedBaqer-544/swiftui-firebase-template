
import Foundation
import FirebaseFirestore
import class Firebase.User
typealias FirebaseUser = Firebase.User


struct User: Codable{
    var Name: String = ""
    var email: String = ""
    var uid: String = ""
    var profileImageUrl: String = ""
    
}


struct SignInCredentials: Encodable
{
    var email: String
    var password: String
}
