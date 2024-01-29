// Controller
import Foundation

let EVENT_TEST = Event(id: "reczHBF34pEPqZ9vY", eventName: "Community building workshop", start: "2024-02-09T13:20:00.000Z", end: "2024-02-09T14:00:00.000Z", notes: "TROLOLOLO XD BING CHILE is a country in western South America. It occupies a long, narrow strip of land between the Andes to the east and the Pacific Ocean to the west. Chile covers an area of 756,096 square kilometres (291,930 sq mi) and has a population of 17.5 million as of 2017. The capital and largest city is Santiago and the national language is Spanish. Chile borders Peru to the north, Bolivia to the northeast, Argentina to the east, and the Drake Passage in the far south. Chilean territory includes the Pacific islands of Juan Fernández, Isla Salas y Gómez, Desventuradas, and Easter Island in Oceania. Chile also claims about 1,250,000 square kilometres (480,000 sq mi) of Antarctica under the Chilean Antarctic Territory.")

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
                    self.eventArray.append(Event(id: schedule.id, eventName: schedule.fields.name ,start: schedule.fields.start , end: schedule.fields.end, notes: schedule.fields.notes))
                }
            } else {
                print("Houston we got a problem")
            }
        }
    }
}

