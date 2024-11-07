protocol SomeDelegate: AnyObject {
    func didSomething()
}

class SomeClass {
    weak var delegate: SomeDelegate?

    func performTask() {
        // Task implementation
        delegate?.didSomething()
    }
}

class AnotherClass: SomeDelegate {
    let someObject = SomeClass()

    init() {
        someObject.delegate = self
    }

    func didSomething() {
        // Handle the event
    }
}
