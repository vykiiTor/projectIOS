//
//  Event.swift
//  IosProject
//
//  Created by Victor  TRAN on 29/01/2024.
//
import Foundation
import SwiftUI

class Event: Decodable, ObservableObject {
    let id: String
    let eventName: String
    let start: String
    let end: String
    let notes: String
    
    init(id: String, eventName: String, start: String, end: String, notes: String) {
        self.id = id
        self.eventName = eventName
        self.start = start
        self.end = end
        self.notes = notes
    }
}

