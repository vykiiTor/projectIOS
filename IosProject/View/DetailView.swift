//
//  DetailView.swift
//  IosProject
//
//  Created by Victor  TRAN on 29/01/2024.
//
import SwiftUI

struct DetailView: View {
    @ObservedObject var event: Event

    init(event: Event) {
        self.event = event
    }

    var body: some View {
        GeometryReader { geo in
            VStack {
                VStack {
                    Text(event.id)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                    
                    Divider()
                    
                    ScrollView {
                        Text(event.start)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.green, lineWidth: 1)
                            )
                    }
                    .frame(height: geo.size.height / 3)
                    .padding()
                    .cornerRadius(5)
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()
            }
            .background(Color.clear) // Set the background color here
        }
        .navigationTitle(event.eventName)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(event: EVENT_TEST)
    }
}
