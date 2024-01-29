//
//  ListRow.swift
//  IosProject
//
//  Created by Victor  TRAN on 29/01/2024.
//

import Foundation

import SwiftUI

struct ListRow: View {
    var event: Event
    
    var body: some View {
        HStack {
            Text(event.id)
            Text(event.eventName)

            Spacer()
        }
    }
}

#Preview {
    ListRow(event: EVENT_TEST)
}

