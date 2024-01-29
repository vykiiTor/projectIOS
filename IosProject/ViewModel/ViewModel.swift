// Controller
import Foundation

let EVENT_TEST = Event(id: "reczHBF34pEPqZ9vY", eventName: "Community building workshop", start: " 2024-02-09T13:20:00.000Z", end: "  2024-02-09T14:00:00.000Z")

class ViewModel : ObservableObject{
    let requestFactory = RequestFactory()
    
    @Published var eventArray: [Event] = []
    
    init() {
        self.getData()
    }
    
    private func getData() {
        requestFactory.getScheduleList { (errorHandle, schedules) in
            if let _ = errorHandle.errorType, let errorMessage = errorHandle.errorMessage {
                print(errorMessage)
            } else if let list = schedules {
                for schedule in list {
                    self.eventArray.append(Event(id: schedule.id, eventName: schedule.fields.name ,start: schedule.fields.start , end: schedule.fields.end))
                }
            } else {
                print("Houston we got a problem")
            }
        }
    }
}

