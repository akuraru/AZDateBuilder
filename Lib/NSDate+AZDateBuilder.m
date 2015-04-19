//
// Created by azu on 2013/01/28.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSDate+AZDateBuilder.h"

const struct AZDateBuilderUnit AZ_DateUnit = {
    .era = @"era",
    .year = @"year",
    .month = @"month",
    .day = @"day",
    .hour = @"hour",
    .minute = @"minute",
    .second = @"second",
    .week = @"week",
    .weekday = @"weekday",
    .weekdayOrdinal = @"weekdayOrdinal",
    .quarter = @"quarter",
    .weekOfMonth = @"weekOfMonth",
    .weekOfYear = @"weekOfYear",
    .yearForWeekOfYear = @"yearForWeekOfYear",
    .nanosecond = @"nanosecond",
    .calendar = @"calendar",
    .timeZone = @"timeZone",
};
#define DATE_COMPONENTS (NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal | NSCalendarUnitQuarter | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitYearForWeekOfYear | NSCalendarUnitNanosecond | NSCalendarUnitCalendar | NSCalendarUnitTimeZone)

@implementation NSDate (AZDateBuilder)

+ (NSDate *)AZ_dateByUnit:(NSDictionary *) builderUnit {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.calendar = calendar;
    for (NSString *key in [builderUnit allKeys]) {
        NSNumber *number = builderUnit[key];
        NSAssert([number isKindOfClass:[NSNumber class]], @"%@ is not kind of NSNumber Class", number);
        [dateComponents setValue:number forKey:key];
    }
    return [calendar dateFromComponents:dateComponents];
}

- (NSDate *)AZ_dateByUnit:(NSDictionary *) builderUnit {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [calendar components:DATE_COMPONENTS fromDate:self];
    dateComponents.calendar = calendar;
    for (NSString *key in [builderUnit allKeys]) {
        NSNumber *number = builderUnit[key];
        NSAssert([number isKindOfClass:[NSNumber class]], @"%@ is not kind of NSNumber Class", number);
        [dateComponents setValue:number forKey:key];
    }
    return [calendar dateFromComponents:dateComponents];
}


+ (NSDate *)dateByUnit:(NSDictionary *) builderUnit {
    return [self AZ_dateByUnit:builderUnit];
}

- (NSDate *)dateByUnit:(NSDictionary *) builderUnit {
    return [self AZ_dateByUnit:builderUnit];
}
@end