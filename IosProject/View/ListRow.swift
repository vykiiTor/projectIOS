//
//  ListRow.swift
//  IosProject
//
//  Created by Victor  TRAN on 29/01/2024.
//

import SwiftUI

struct ListRow: View {
    var event: Event

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Event Name: \(event.eventName)")
                    .font(.headline)
            }
            Spacer()
        }
        .padding(8)
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(event: EVENT_TEST)
    }
}


