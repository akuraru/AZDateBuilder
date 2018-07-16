import Foundation

extension Date {
    static func date(by unit: [Calendar.Component: Int]) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        for (component, value) in unit {
            dateComponents.setValue(value, for: component)
        }
        return calendar.date(from: dateComponents)!
    }
    
    func date(by unit: [Calendar.Component: Int]) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = calendar.dateComponents(allComponents(), from: self)
        dateComponents.calendar = calendar
        for (component, value) in unit {
            dateComponents.setValue(value, for: component)
        }
        return calendar.date(from: dateComponents)!
    }
    
    private func allComponents() -> Set<Calendar.Component> {
        return [.era, .year, .month, .day, .hour, .minute, .second, .nanosecond]
    }
}
