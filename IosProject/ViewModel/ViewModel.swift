


// Controller
let requestFactory = RequestFactory()
requestFactory.getFurnitureList { (errorHandle, furnitures) in
if let _ = errorHandle.errorType, let errorMessage =
errorHandle.errorMessage {
print(errorMessage)
}
else if let list = furnitures {
for furniture in list {
print(furniture.fields.name)
}
}
else {
print("Houston we got a problem")
}
}
