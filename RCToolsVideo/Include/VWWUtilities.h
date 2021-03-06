//
//  VWWUtilities.h
//  RC Video
//
//  Created by Zakk Hoyt on 3/10/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VWW.h"
@class CLLocation;
@class CLHeading;

@interface VWWUtilities : NSObject

@end

@interface VWWUtilities (DateFormatter)
//+(NSDate*)dateFromString:(NSString*)string;
+(NSDate*)dateAndTimeFromString:(NSString*)string;
//+(NSString*)stringFromDate:(NSDate*)date;
+(NSString*)stringFromDateAndTime:(NSDate*)date;
@end

@interface VWWUtilities (Conversion)
+(float)metersToFeet:(float)meters;
+(float)metersBetweenPointA:(CLLocation*)pointA pointB:(CLLocation*)pointB;
+(float)feetBetweenPointA:(CLLocation*)pointA pointB:(CLLocation*)pointB;

+(NSString*)jsonRepresentationOfDictionary:(NSDictionary*)dictionary prettyPrint:(BOOL)prettyPrint;
+(NSString*)jsonRepresentationOfArray:(NSArray*)array prettyPrint:(BOOL)prettyPrint;
+(NSString*)jsonStringFromDictionary:(NSDictionary*)dictionary prettyPrint:(BOOL)prettyPrint;

@end

@interface VWWUtilities (Location)
+(void)stringFromLatitude:(double)latitude longitude:(double)longitude completionBlock:(VWWStringBlock)completionBlock;
+(void)stringLocalityFromLatitude:(double)latitude longitude:(double)longitude completionBlock:(VWWStringBlock)completionBlock;
+(void)stringThoroughfareFromLatitude:(double)latitude longitude:(double)longitude completionBlock:(VWWStringBlock)completionBlock;
@end