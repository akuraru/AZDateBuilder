//
// Created by azu on 2013/01/28.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <SenTestingKit/SenTestingKit.h>

#define HC_SHORTHAND 1

#import <OCHamcrest/OCHamcrest.h>
#import "NSDate+AZDateBuilder.h"


@interface NSDate_AZDateBuilderTest : SenTestCase
@end

@implementation NSDate_AZDateBuilderTest {
}

#define DATE_COMPONENTS (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit)


- (void)testInstanceAZ_dateByUnit {
    // given
    NSArray *undefinedKeys = @[
        AZ_DateUnit.year,
        AZ_DateUnit.month,
        AZ_DateUnit.day,
    ];
    NSDictionary *unit = @{
        AZ_DateUnit.hour : @1,
        AZ_DateUnit.minute : @1,
        AZ_DateUnit.second : @1
    };
    // when
    NSDate *basedDate = [NSDate date];
    NSDate *date = [basedDate AZ_dateByUnit:unit];
    // then
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:DATE_COMPONENTS fromDate:date];
    NSDateComponents *basedComponents = [calendar components:DATE_COMPONENTS fromDate:basedDate];
    for (NSString *key in [unit allKeys]) {
        NSNumber *value = [components valueForKey:key];
        assertThat(value, equalTo(unit[key]));
    }
    for (NSString *key in undefinedKeys) {
        NSNumber *value = [components valueForKey:key];
        NSNumber *expectValue = [basedComponents valueForKey:key];
        assertThat(value , equalTo(expectValue));
    }
}


- (void)testCreateNSDate {
    // given
    NSDictionary *unit = @{
        AZ_DateUnit.year : @1,
        AZ_DateUnit.month : @1,
        AZ_DateUnit.day : @1,
        AZ_DateUnit.hour : @1,
        AZ_DateUnit.minute : @1,
        AZ_DateUnit.second : @1
    };
    // when
    NSDate *date = [NSDate AZ_dateByUnit:unit];
    // then
    id calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:DATE_COMPONENTS fromDate:date];
    for (NSString *key in [unit allKeys]) {
        NSNumber *value = [components valueForKey:key];
        assertThat(value, is(equalTo(unit[key])));
    }
}

- (void)testCreateNSDateUndefinedKey {
    // given
    NSArray *undefinedKeys = @[
        AZ_DateUnit.year,
        AZ_DateUnit.month,
        AZ_DateUnit.day,
        AZ_DateUnit.second
    ];
    NSDictionary *unit = @{
        AZ_DateUnit.hour : @1,
        AZ_DateUnit.minute : @1,
    };
    NSDate *date = [NSDate AZ_dateByUnit:unit];
    // then
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *resultComponents = [calendar components:DATE_COMPONENTS fromDate:date];
    // empty dateComponents -> date -> dateComponents
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.calendar = calendar;
    NSDateComponents *components = [calendar components:DATE_COMPONENTS fromDate:[dateComponents date]];
    components.calendar = calendar;
    for (NSString *key in undefinedKeys) {
        // undefined value
        id defaultValue = [components valueForKey:key];
        id resultValue = [resultComponents valueForKey:key];
        assertThat(resultValue, is(equalTo(defaultValue)));
    }

}
@end
