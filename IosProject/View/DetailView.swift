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
                    Text(event.eventName)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    Divider()
                    
                    Text("The event schedule from:")
                        .font(.headline)
                    Text(formatTime(event.start))
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.green, lineWidth: 1)
                        )
                    
                    Text("to :")
                        .font(.headline)
                    Text(formatTime(event.end))
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.green, lineWidth: 1)
                        )
                    
                    ScrollView{
                        Text(event.notes ?? "")
                            .padding()
                            .foregroundColor(.black)
                    }

                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()
            }
            .background(Color.clear)
        }
        .navigationTitle(event.eventName)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(event: EVENT_TEST)
    }
}

private func formatDate(_ dateString: String) -> String {
    let isoDateFormatter = ISO8601DateFormatter()
    isoDateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

    if let date = isoDateFormatter.date(from: dateString) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: date)
    } else {
        return "Invalid Date"
    }
}

private func formatTime(_ dateString: String) -> String {
    let isoDateFormatter = ISO8601DateFormatter()
    isoDateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

    if let date = isoDateFormatter.date(from: dateString) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mma"
        return dateFormatter.string(from: date)
    } else {
        return "Invalid Time"
    }
}

