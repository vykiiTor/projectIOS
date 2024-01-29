//
//  Schedule.swift
//  IosProject
//
//  Created by Victor  TRAN on 22/01/2024.
//

import UIKit
import Foundation

// Model
struct Records: Codable {
    let records: [Schedule]?
}
struct Schedule: Codable {
    let id: String
    let fields: Fields
}
struct Fields: Codable {
    let name: String
    let type: String?
}

struct Schedules: Codable {
    var results: [Schedule]
    
    enum CodingKeys : String, CodingKey {
        case results = "records"
    }
}
let url_string = "https://api.airtable.com/v0/apps3Rtl22fQOI9Ph"
//"https://api.airtable.com/v0/app9Bb0rNJmZJZ3cQ/Furniture?maxRecords=3&view=All%20furniture" lien davant
let token = "patikQ2NLt8ZuefWF.bab4360644fa68db943fec3ff9db7a0bb990674f092136422b3a0be9212e229d"

protocol RequestFactoryProtocol {
    func createRequest(urlStr: String) -> URLRequest
    func getScheduleList(callback: @escaping (Schedules?) -> Void)
}

class RequestFactory: RequestFactoryProtocol{
    func createRequest(urlStr: String) -> URLRequest {
        let url = URL(string: urlStr)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        return request
    }
    
    func getScheduleList(callback: @escaping (Schedules?) -> Void) {
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: createRequest(urlStr: url_string)){ data, response, error in
            guard error == nil, let data = data else{
                callback(nil)
                return
            }
            guard let responseHttp = response as? HTTPURLResponse,responseHttp.statusCode == 200 else {
                    callback(nil)
                    return
            }
            guard let result = try? JSONDecoder().decode(Schedules.self, from: data) else {
                callback(nil)
                return
            }
            callback(result)
        }.resume()
    }
}


    RequestFactory().getScheduleList {
        schedule in print(schedule)
    }

/*
 struct UrlImage: Codable {
     
     let url: String
     
     enum CodingKeys : String, CodingKey {
         case url = "url"
     }
 }

 struct Furniture : Codable{
     
     let name: String
     let type: String
     let images_url: [UrlImage]
     
     enum CodingKeys : String, CodingKey {
         case name = "Name"
         case type = "Type"
         case images_url = "Images"
     }
 }


struct Schedules: Codable {
    var results: [Schedule]
    
    enum CodingKeys : String, CodingKey {
        case results = "records"
    }
}
 
 
 func getScheduleList(callback: @escaping ([Schedule]?) -> Void) {
     let session = URLSession(configuration: .default)
     
     session.dataTask(with: createRequest(urlStr: url_string)){ data, response, error in
         guard error == nil, let data = data else{
             callback(nil)
             return
         }
         guard let responseHttp = response as? HTTPURLResponse,responseHttp.statusCode == 200 else {
                 callback(nil)
                 return
         }
         guard let result = try? JSONDecoder().decode(Furnitures.self, from: data) else {
             callback(nil)
             return
         }
         callback(result)
     }.resume()
 }
 */
//let jsonData = jsonString.data(encoding: .utf8)!
//let decoder = JSONDecoder()
//let person = try! decoder.decode(Person.self, for: jsonData)
