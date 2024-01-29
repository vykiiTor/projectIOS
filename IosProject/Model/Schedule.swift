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
    enum CodingKeys : String, CodingKey{
        case name = "Activity"
    }
}

let url_string = "https://api.airtable.com/v0/apps3Rtl22fQOI9Ph/%F0%9F%93%86%20Schedule"
let token = "patikQ2NLt8ZuefWF.bab4360644fa68db943fec3ff9db7a0bb990674f092136422b3a0be9212e229d"

struct Response: Codable {
    let id: String
}

struct ErrorResponse: Codable {
    let error: String
}

enum RequestType: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

enum CustomError: Error {
    case requestError
    case statusCodeError
    case parsingError
}

// Request Factory
protocol RequestFactoryProtocol {
    func createRequest(urlStr: String) -> URLRequest
    func getScheduleList(callback: @escaping ((errorType: CustomError?, errorMessage: String?), [Schedule]?) -> Void)
}

class RequestFactory: RequestFactoryProtocol {
    internal func createRequest(urlStr: String) -> URLRequest {
        var url: URL = URL(string: urlStr)!

        var request = URLRequest(url: url)
        request.timeoutInterval = 100
        request.httpMethod = RequestType.get.rawValue
        let access_token = token
        request.setValue("Bearer \(access_token)", forHTTPHeaderField: "Authorization")

        return request
    }

    func getScheduleList(callback: @escaping ((errorType: CustomError?, errorMessage: String?), [Schedule]?) -> Void) {
        let furnitureUrlStr = url_string
        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: createRequest(urlStr: furnitureUrlStr)) { data, response, error in
            // Handle data error
            guard error == nil, let data = data else {
                callback((CustomError.requestError, error.debugDescription), nil)
                return
            }

            // Handle http error
            guard let responseHttp = response as? HTTPURLResponse else {
                callback((CustomError.requestError, error.debugDescription), nil)
                return
            }

            // Handle status code error
            guard responseHttp.statusCode == 200 else {
                callback((CustomError.statusCodeError, "status code: \(responseHttp.statusCode)"), nil)
                return
            }

            // Handle parsing error
            guard let result = try? JSONDecoder().decode(Records.self, from: data) else {
                callback((CustomError.parsingError, "parsing error"), nil)
                return
            }

            // If everything went good
            callback((nil, nil), result.records)
        }

        task.resume()
    }
}

