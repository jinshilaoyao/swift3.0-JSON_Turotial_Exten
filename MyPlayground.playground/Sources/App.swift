import Foundation

class Person {
    var name: String
    var age: Int
    
    init?(json: [String: Any]) {
        
        guard let person = json["person"] as? [String: Any], let name = person["name"] as? String, let ageStr = person["age"] as? String, let age = Int(ageStr) else {
            return nil
        }

        self.name = name
        self.age = age
    }
}
