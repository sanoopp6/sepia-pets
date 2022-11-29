//
//  WorkingTime.swift
//  Sepia Pets
//
//  Created by Sanoop PM on 30/11/22.
//

import Foundation


let regex = try! NSRegularExpression(pattern: "(?<startDay>\\w{1,2})-(?<endDay>\\w{1,2})\\s(?<openHour>\\d{1,2}):(?<openMin>\\d{1,2})\\s-\\s(?<closeHour>\\d{1,2}):(?<closeMin>\\d{1,2})",
                                     options: .caseInsensitive)

var days = ["S": 1, "M": 2, "Tu": 3, "W" : 4, "Th": 5, "F" : 6, "Sa" : 7]


func checkWorkingTime(input: String) -> Bool {

    let range = NSRange(location: 0, length: input.utf8.count)

    guard let match = regex.firstMatch(in: input, options: [], range: range) else {
        assert(false, "Regular expression not match!")
    }

    guard let startDayRange = Range(match.range(withName: "startDay"), in: input),
          let endDayRange = Range(match.range(withName: "endDay"), in: input),
        let openHourRange = Range(match.range(withName: "openHour"), in: input),
        let openMinRange = Range(match.range(withName: "openMin"), in: input),
        let closeHourRange = Range(match.range(withName: "closeHour"), in: input),
        let closeMinRange = Range(match.range(withName: "closeMin"), in: input) else {
        assert(false, "Did not find the named groups")
    }

     
    
    guard  let startDay = days[String(input[startDayRange])],
           let endDay = days[String(input[endDayRange])],
           let openHour = Int(input[openHourRange]),
            let openMin = Int(input[openMinRange]),
            let closeHour = Int(input[closeHourRange]),
            let closeMin = Int(input[closeMinRange]) else {
        assert(false, "Failed to convert data")
    }

//    print("startday: \(startDay) endday: \(endDay)  Opens at: \(openHour):\(openMin) and closes at \(closeHour):\(closeMin)")

    let tz = NSTimeZone.default
    let now = NSCalendar.current.dateComponents(in: tz, from: Date())

    guard let hour = now.hour,
        let minute = now.minute,
        let weekday = now.weekday else  {
            assert(false, "this should never happen")
    
    }
//    print("weekday\(weekday)")
    let rightNowInMinutes = hour * 60 + minute
    let opensAt = openHour * 60 + openMin
    let closesAt = closeHour * 60 + closeMin

    assert(opensAt < closesAt, "Opening after closing does not make sense")

    return rightNowInMinutes > opensAt &&
    rightNowInMinutes < closesAt && (weekday >= startDay && weekday <= endDay)
}
