//
//  SwiftTests.swift
//  SwiftTests
//
//  Created by akuraru on 2018/07/16.
//  Copyright © 2018年 azu. All rights reserved.
//

import XCTest

class SwiftTests: XCTestCase {
    func components() -> Set<Calendar.Component> {
        return [.era, .year, .month, .day, .weekday, .hour, .minute, .second, .weekday, .weekdayOrdinal]
    }
    
    func testInstance_dateByUnit() {
        // given
        let undefinedKeys: Set<Calendar.Component> = [.year, .month, .day]
        let unit: [Calendar.Component: Int] = [
            .hour: 1,
            .minute: 1,
            .second: 1
        ]
        //when
        let basedDate = Date()
        let date = basedDate.date(by: unit)
        let calendar = Calendar(identifier: .gregorian)
        let dateComponents = calendar.dateComponents(components(), from: date)
        let basedComponents = calendar.dateComponents(components(), from: basedDate)
        // then
        for (key, value) in unit {
            XCTAssertEqual(dateComponents.value(for: key), value)
        }
        for key in undefinedKeys {
            XCTAssertEqual(dateComponents.value(for: key), basedComponents.value(for: key))
        }
    }
    
    func testCreateDate() {
        // given
        let unit: [Calendar.Component: Int] = [
            .year: 1,
            .month: 1,
            .day: 1,
            .hour: 1,
            .minute: 1,
            .second: 1
        ]
        // when
        let date = Date.date(by: unit)
        // then
        let calendar = Calendar(identifier: .gregorian)
        let dateComponents = calendar.dateComponents(components(), from: date)
        for (key, value) in unit {
            XCTAssertEqual(dateComponents.value(for: key), value)
        }
    }
    
    func testCreateDateUndefinedKey() {
        // given
        let undefinedKeys: [Calendar.Component] = [.year, .month, .day, .second]
        let unit: [Calendar.Component: Int] = [
            .hour: 1,
            .minute: 1,
        ]
        let date = Date.date(by: unit)
        // then
        let calendar = Calendar(identifier: .gregorian)
        let resultComponents = calendar.dateComponents(self.components(), from: date)
        // empty dateComponents -> date -> dateComponents
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar;
        let components = calendar.dateComponents(self.components(), from: dateComponents.date!)
        
        for (key, value) in unit {
            XCTAssertEqual(resultComponents.value(for: key), value)
        }
        for key in undefinedKeys {
            // undefined value
            let defaultValue = components.value(for: key)
            let resultValue = resultComponents.value(for: key)
            XCTAssertEqual(defaultValue, resultValue)
        }
    }
}
