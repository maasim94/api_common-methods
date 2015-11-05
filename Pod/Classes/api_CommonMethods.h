//
//  api.h
//  Calculator
//
//  Created by Shaharyar HAFEEZ on 6/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "sqlite3.h"
#import <QuartzCore/QuartzCore.h>
#import <math.h>

@interface api_CommonMethods: NSObject



#pragma mark -
#pragma mark Check System Versions
#define SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
# define ErrorMessage ("No Internet Connectivity")


#pragma mark -
#pragma mark custom Methods
+(void)makeAPhoneCallOnNumber:(NSString *)number;
+(CGFloat)getMaximumLabelHeightwithGivenWidth:(float) width andString:(NSString *)text;

// CA transition (fade in/out) Functions
+(void)transitionOnView:(UIView *)fadeView ;


// Mobile Model Detection
+(NSInteger)DeviceModel;
//CSV parser
+(NSMutableArray *)CSVParser:(NSString *)string;

//==========================================================================================
// popUpAnimation
//==========================================================================================
+(void)popUpAnimationWithType:(NSString *)Effect onNavigationController:(UINavigationController *)Controller;

//==========================================================================================
// Sort Array
//==========================================================================================
+(NSArray *) sortArray :(NSMutableArray *)array;
//==================================================
//Color of a pixel and inverse color of given color
//==================================================
+ (UIColor *) inverseColor: (UIColor *)GivenColor;
+ (UIColor*) getPixelColorAtLocation:(CGPoint)point Image:(UIImage *)image;

//==================================================
//CheckValidity of Email
//==================================================

+(BOOL) IsValidEmail:(NSString *)checkString;
+(NSIndexPath *)returnIndexPathofSender:(id)sender fromTableView:(UITableView *)tableView;

#pragma mark -
#pragma mark RoundIMageView

+(NSMutableArray *)AllCountriesName;
+(void)RoundImageView:(UIImageView *)imgView;


#pragma mark -
#pragma mark Coversion Methods
+(int)convertToint:(NSString *)str;

+(NSString *)convertToString:(int)val;

+(float)convertStringToFloat:(NSString *)str;

+(NSString *)convertFloatToString:(float)val;


#pragma mark -
#pragma mark String functions
+(BOOL)CompareStrings:(NSString *)str1 string2:(NSString *)str2;

+(BOOL)StringContains:(NSString *)mainString smallString:(NSString *)smallString;

+(NSInteger)ReturnIndexof:(NSString *)mainString smallString:(NSString *)smallString;

+(NSString *)returnSubstringbyIndex:(NSInteger)index1 index2:(NSInteger)index2 string:(NSString *)mainString;

+(NSString *)returnSubstringbyValue:(NSString *)str1 str2:(NSString *)str2 string:(NSString *)mainString;

+(NSString *)removeSpaces:(NSString *)string;

+(NSString *)replaceStringwithString:(NSString *)mainString strTobeReplaced:(NSString *)strTobeReplaced stringReplaceWith:(NSString *)stringReplaceWith;

+(NSString *)Append:(NSString *)mainString subString:(NSString *)subString;

+(NSArray *)tocanizeTheString:(NSString *)mainString tocan:(NSString *)tocan;

+(NSString *)performFormating:(float)value;

+(NSString *)checkDecimals:(NSString *)value;

#pragma mark -
#pragma mark Google Maps Functions

+(NSString *)adressFromLatLon_New:(NSString *)lat Lon:(NSString *)lon;

+(NSString *)latlonfromAddress_New:(NSString *)address;

#pragma mark -
#pragma mark Tab Bar Functions

+ (void) showTabBar:(UITabBarController *) tabbarcontroller;

+ (void) hideTabBar:(UITabBarController *) tabbarcontroller;

#pragma mark -
#pragma mark Calender Functions

+(NSMutableArray *)get_Start_End_Day_OfWeek:(NSDate *)date;

+(NSDate *)getLastDateOfMonth:(NSDate *)date;

+(NSDate *)getStartingDateOfMonth:(NSDate *)date;

+(NSInteger)getWeekNo:(NSDate *)date;

+(NSDate *)getNextDay:(NSDate *)date;

+(NSDate *)getPreviousDay:(NSDate *)date;

+(NSInteger)getWeeks:(NSDate *)date;

#pragma mark -
#pragma mark AlertViews
+(UIAlertView *)simpleAlert:(NSString *)title desc:(NSString *)descr;
+(UIAlertView *)simpleAlertWithYesNo:(NSString *)title desc:(NSString *)descr andtag:(NSInteger)tag delegate:(id)delegate;
+(UIAlertView *)simpleAlertWith2Options:(NSString *)title desc:(NSString *)descr cancelOption:(NSString *)cancel otherOption:(NSString *)option2 andTag:(NSInteger)tag andDelegate:(id)delegate;
@end
