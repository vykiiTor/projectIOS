// Controller
import Foundation



class ViewModel : ObservableObject{
    let requestFactory = RequestFactory()
    
    init() {
        self.getData()
    }
    
    private func getData() {
        let truc = requestFactory.getScheduleList { (errorHandle, schedules) in
            if let errorType = errorHandle.errorType, let errorMessage = errorHandle.errorMessage {
                print(errorMessage)
            } else if let list = schedules {
                for schedule in list {
                    print(schedule.fields.name)
                }
            } else {
                print("Houston we got a problem")
            }
        }
    }
}
