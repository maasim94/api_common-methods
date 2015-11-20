//
//  api.h
//
//  Created by Arslan Asim on 6/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


//#import "sqlite3.h"
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
+(void)makeAPhoneCallOnNumber:(nonnull NSString *)number;
+(CGFloat)getMaximumLabelHeightwithGivenWidth:(float) width andString:(nonnull NSString *)text;

// CA transition (fade in/out) Functions
+(void)transitionOnView:(nonnull UIView *)fadeView ;


// Mobile Model Detection
+(NSInteger)DeviceModel;
//CSV parser
+(nullable NSMutableArray *)CSVParser:(nonnull NSString *)string;

//==========================================================================================
// popUpAnimation
//==========================================================================================
+(void)popUpAnimationWithType:( nonnull NSString *)Effect onNavigationController:(nonnull UINavigationController *)Controller;

//==========================================================================================
// Sort Array
//==========================================================================================
+(nonnull NSArray *) sortArray :(nonnull NSMutableArray *)array;
//==================================================
//Color of a pixel and inverse color of given color
//==================================================
+ (nullable UIColor *) inverseColor: (nonnull UIColor *)GivenColor;
+ (nullable UIColor*) getPixelColorAtLocation:(CGPoint)point Image:(nonnull UIImage *)image;

//==================================================
//CheckValidity of Email
//==================================================

+(BOOL) IsValidEmail:(nonnull NSString *)checkString;
+(nonnull NSIndexPath *)returnIndexPathofSender:(nonnull id)sender fromTableView:(nonnull UITableView *)tableView;

#pragma mark -
#pragma mark RoundIMageView

+(nonnull NSMutableArray *)AllCountriesName;
+(void)RoundImageView:(nonnull UIImageView *)imgView;


#pragma mark -
#pragma mark Coversion Methods
+(int)convertToint:(nonnull NSString *)str;

+(nullable NSString *)convertToString:(int)val;

+(float)convertStringToFloat:(nonnull  NSString *)str;

+(nullable NSString *)convertFloatToString:(float)val;


#pragma mark -
#pragma mark String functions
+(BOOL)CompareStrings:(nonnull NSString *)str1 string2:(nonnull NSString *)str2;

+(BOOL)StringContains:(nonnull NSString *)mainString smallString:(nonnull NSString *)smallString;

+(NSInteger)ReturnIndexof:(nonnull NSString *)mainString smallString:(nonnull NSString *)smallString;

+(nullable NSString *)returnSubstringbyIndex:(NSInteger)index1 index2:(NSInteger)index2 string:(nonnull NSString *)mainString;

+(nullable NSString *)returnSubstringbyValue:(nonnull NSString *)str1 str2:(nonnull NSString *)str2 string:(nonnull NSString *)mainString;

+(nullable NSString *)removeSpaces:(nonnull NSString *)string;

+(nullable NSString *)replaceStringwithString:(nonnull NSString *)mainString strTobeReplaced:(nonnull NSString *)strTobeReplaced stringReplaceWith:(nonnull NSString *)stringReplaceWith;

+(nullable NSString *)Append:(nonnull NSString *)mainString subString:(nonnull NSString *)subString;

+(nullable NSArray *)tocanizeTheString:(nonnull NSString *)mainString tocan:(nonnull NSString *)tocan;

+(nullable NSString *)performFormating:(float)value;

+(nullable NSString *)checkDecimals:(nonnull NSString *)value;

#pragma mark -
#pragma mark Google Maps Functions

+(nullable NSString *)adressFromLatLon_New:(nonnull NSString *)lat Lon:(nonnull NSString *)lon;

+(nullable NSString *)latlonfromAddress_New:(nonnull NSString *)address;

#pragma mark -
#pragma mark Tab Bar Functions

+ (void) showTabBar:(nonnull UITabBarController *) tabbarcontroller;

+ (void) hideTabBar:(nonnull UITabBarController *) tabbarcontroller;

#pragma mark -
#pragma mark Calender Functions

+(nullable NSMutableArray *)get_Start_End_Day_OfWeek:(nonnull NSDate *)date;

+(nullable NSDate *)getLastDateOfMonth:(nonnull NSDate *)date;

+( nullable NSDate *)getStartingDateOfMonth:(nonnull NSDate *)date;

+(NSInteger)getWeekNo:(nonnull NSDate *)date;

+(nullable NSDate *)getNextDay:(nonnull NSDate *)date;

+(nullable NSDate *)getPreviousDay:(nonnull NSDate *)date;

+(NSInteger)getWeeks:(nonnull NSDate *)date;

#pragma mark -
#pragma mark AlertViews
+(nonnull UIAlertView *)simpleAlert:(nullable NSString *)title desc:(nullable NSString *)descr;
+(nonnull UIAlertView *)simpleAlertWithYesNo:(nullable NSString *)title desc:(nullable NSString *)descr andtag:(NSInteger)tag delegate:(nullable id)delegate;
+(nonnull UIAlertView *)simpleAlertWith2Options:(nullable NSString *)title desc:(nullable NSString *)descr cancelOption:(nullable NSString *)cancel otherOption:(nullable NSString *)option2 andTag:(NSInteger)tag andDelegate:(nullable id)delegate;
#pragma mark -
#pragma mark AlertControllers

+(nonnull UIAlertController *)simpleAlertController:(nullable NSString *)title message:(nullable NSString *)message handler:(void (^ __nullable)( UIAlertAction * _Nullable action))myHandler;

+(void )showSimpleAlertController:(nullable NSString *)title message:(nullable NSString *)message handler:(void (^ __nullable)( UIAlertAction * _Nullable action))myHandler;

+(void )showAlertControllerWithYesNoOptions:(nullable NSString *)title message:(nullable NSString *)message yesHandler:(void (^ __nullable)( UIAlertAction * _Nullable action))yesHandler noHandler:(void (^ __nullable)( UIAlertAction * _Nullable action))noHandler;

+(void)showAlertControllerWith2Options:(nullable NSString *)title message:(nullable NSString *)message Option1:(nonnull NSString *)option1 option2:(nonnull NSString *)option2 option1Handler:(void (^ __nullable)( UIAlertAction * _Nullable action))option1Handler option2Handler:(void (^ __nullable)( UIAlertAction * _Nullable action))option2Handler;

#pragma mark -
#pragma mark AlertControllers with TextFields

+(void)showInputAlertwithTitle:(nullable NSString *)title message:(nullable NSString *)message okButttonTitle:(nonnull NSString *)buttonTitle cancelButtonTitle:(nullable NSString *)cancelButtonTitle numberofTextFields:(NSInteger )number textfieldRetuner:(void (^ __nullable)(NSInteger order , UITextField * _Nonnull textField))textFieldReturner okButtonAction:(void (^ __nullable)(UIAlertAction * _Nullable action , NSArray * _Nonnull textFieldArray))okHandler cancelButtonAction:(void (^ __nullable)(UIAlertAction * _Nullable action , NSArray * _Nullable textFieldArray))cancelHandler;;

#pragma mark -
#pragma mark TOP View Controllers
+(nonnull UIViewController *)topViewController;



@end
