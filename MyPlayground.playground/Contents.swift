//: Playground - noun: a place where people can play

import UIKit

let str = Bundle.main.path(forResource: "person", ofType: "json")
let url = URL(fileURLWithPath: str!)
let data = try! Data(contentsOf: url)

var json: [Any]?

do {
    json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [Any]
} catch {
    print(error)
}

/*
 
 func one() {
  step one:
     guard let item = json?.first as? [String: Any], let person = item["person"] as? [String: Any], let name = person["name"] as? String, let ageStr = person["age"] as? String, let age = Int(ageStr) else {
         return
     }
 
 
 }
 
 */

/*
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

func one() {
    
    guard let item = json?.first as? [String: Any] else {
        return
    }
    let person = Person(json: item)
    person?.age
    
}
*/

enum SerializationError: Error {
    case missing(String)
}

class Person {
    var name: String
    var age: Int
    
    init(json: [String: Any]) throws {
        guard let person = json["person"] as? [String: Any] else {
            throw SerializationError.missing("person")
        }
        
        guard let name = person["name"] as? String else {
            throw SerializationError.missing("name")
        }
        
        guard let ageStr = person["age"] as? String, let age = Int(ageStr) else {
            throw SerializationError.missing("age")
        }
        
        self.name = name
        self.age = age
    }
}
func one() {
    let personJson = json?.first as? [String: Any]
    do {
        let person = try Person(json: personJson!)
        print(person.age)
    } catch let error {
        print(error)
    }
}
one()

