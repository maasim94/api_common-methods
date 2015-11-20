//
//  api_CommonMethods.m
//
//  Created by Arslan Asim on 6/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "api_CommonMethods.h"

@implementation api_CommonMethods
#pragma mark -
#pragma mark PhoneCall
+(void)makeAPhoneCallOnNumber:(NSString *)number
{
    NSString *cleanedString = [[number componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789-+()"] invertedSet]] componentsJoinedByString:@""];
    NSString *escapedPhoneNumber = [cleanedString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *phoneURLString = [NSString stringWithFormat:@"telprompt:%@", escapedPhoneNumber];
    NSURL *phoneURL = [NSURL URLWithString:phoneURLString];
    if ([[UIApplication sharedApplication] canOpenURL:phoneURL]) {
        [[UIApplication sharedApplication] openURL:phoneURL];
    }
    else
        [[self simpleAlert:@"Error" desc:@"Device Does Not Support Phone Calls"]show];
}
+(CGFloat)getMaximumLabelHeightwithGivenWidth:(float) width andString:(NSString *)text
{
    CGSize maximumLabelSize = CGSizeMake(width, MAXFLOAT);
    
    NSStringDrawingOptions options = NSStringDrawingTruncatesLastVisibleLine |
    NSStringDrawingUsesLineFragmentOrigin;
    
    NSDictionary *attr = @{NSFontAttributeName: [UIFont systemFontOfSize:15]};
    CGRect labelBounds = [text boundingRectWithSize:maximumLabelSize
                                            options:options
                                         attributes:attr
                                            context:nil];
    CGFloat height = labelBounds.size.height;
    return height;
}
+(NSMutableArray *)AllCountriesName
{
    NSLocale *locale = [NSLocale currentLocale];
    NSArray *countryArray = [NSLocale ISOCountryCodes];
    
    NSMutableArray *sortedCountryArray = [[NSMutableArray alloc] init];
    
    for (NSString *countryCode in countryArray) {
        
        NSString *displayNameString = [locale displayNameForKey:NSLocaleCountryCode value:countryCode];
        [sortedCountryArray addObject:displayNameString];
        
    }
    
    
    [sortedCountryArray sortUsingSelector:@selector(localizedCompare:)];
    return sortedCountryArray;
}
//==========================================================================================
// RoundImageView
//==========================================================================================

+(void)RoundImageView:(UIImageView *)imgView
{
    imgView.contentMode=UIViewContentModeScaleAspectFill;
    float width=imgView.frame.size.width;
    float radius=width/2;
    imgView.layer.cornerRadius=radius;
    imgView.layer.borderWidth=0;
    [[imgView layer]setMasksToBounds:YES];
    
    
}
//==========================================================================================
// CA transition (fade in/out) Functions
//==========================================================================================

+(void)transitionOnView:(UIView *)fadeView
{
    [CATransaction begin];
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.duration = .50;
    [[fadeView layer] addAnimation:animation forKey:@"Fade"];
    [CATransaction commit];
    
    
    
    
}
+(void)popUpAnimationWithType:(NSString *)Effect onNavigationController:(UINavigationController *)Controller
{
    CATransition* transition = [CATransition animation];
    transition.duration = .60;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFromTop;
    if ([Effect isEqualToString:@"bottom"])
    {
        transition.type = kCATransitionReveal;
        transition.subtype=kCATransitionFromBottom;
    }
    [Controller.view.layer addAnimation:transition
                                 forKey:kCATransition];
    [Controller popViewControllerAnimated:NO];
    
    
}
//==========================================================================================
// Normal Functions
//==========================================================================================

+(int)convertToint:(NSString *)str
{
    return [str intValue];
}

+(NSString *)convertToString:(int)val
{
    return [NSString stringWithFormat:@"%d", val];
}

+(float)convertStringToFloat:(NSString *)str;
{
    return [str floatValue];
}

+(NSString *)convertFloatToString:(float)val;
{
    return [NSString stringWithFormat:@"%f", val];
}

+(UIAlertView *)simpleAlert:(NSString *)title desc:(NSString *)descr
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:descr delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    return alert;
}
+(UIAlertView *)simpleAlertWithYesNo:(NSString *)title desc:(NSString *)descr andtag:(NSInteger)tag delegate:(id)delegate
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:descr delegate:delegate cancelButtonTitle:@"No" otherButtonTitles:@"Yes",nil];
    alert.tag = tag;
    return alert;
}
+(UIAlertView *)simpleAlertWith2Options:(NSString *)title desc:(NSString *)descr cancelOption:(NSString *)cancel otherOption:(NSString *)option2 andTag:(NSInteger )tag andDelegate:(id)delegate
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:descr delegate:delegate cancelButtonTitle:cancel otherButtonTitles:option2,nil];
    alert.tag = tag;
    return alert;
}
+(BOOL)CompareStrings:(NSString *)str1 string2:(NSString *)str2
{
    if([str1 isEqualToString:str2])
    {
        return true;
    }
    else
    {
        return false;
    }
}

+(BOOL)StringContains:(NSString *)mainString smallString:(NSString *)smallString
{
    if([mainString rangeOfString:smallString].location == NSNotFound)
    {
        return false;
    }
    else
    {
        return true;
    }
}

+(NSInteger)ReturnIndexof:(NSString *)mainString smallString:(NSString *)smallString
{
    if([mainString rangeOfString:smallString].location == NSNotFound)
    {
        return -1;
    }
    else
    {
        return [mainString rangeOfString:smallString].location;
    }
}

+(NSString *)returnSubstringbyIndex:(NSInteger)index1 index2:(NSInteger)index2 string:(NSString *)mainString
{
    return [mainString substringWithRange:NSMakeRange(index1, index2)];
}

+(NSString *)returnSubstringbyValue:(NSString *)str1 str2:(NSString *)str2 string:(NSString *)mainString
{
    NSInteger range = [self ReturnIndexof:mainString smallString:str1];
    NSInteger range0 = [str1 length];
    NSInteger range1 = range + range0;
    NSInteger range2 = [self ReturnIndexof:mainString smallString:str2];
    
    NSInteger newRange2 = range2-range1;
    
    return [self returnSubstringbyIndex:range1 index2:newRange2 string:mainString];
    
}

+(NSString *)removeSpaces:(NSString *)string
{
    return [string stringByReplacingOccurrencesOfString:@" " withString:@""];
}

+(NSString *)replaceStringwithString:(NSString *)mainString strTobeReplaced:(NSString *)strTobeReplaced stringReplaceWith:(NSString *)stringReplaceWith;
{
    return [mainString stringByReplacingOccurrencesOfString:strTobeReplaced withString:stringReplaceWith];
}

+(NSString *)Append:(NSString *)mainString subString:(NSString *)subString
{
    return [mainString stringByAppendingString:subString];
}

+(NSArray *)tocanizeTheString:(NSString *)mainString tocan:(NSString *)tocan
{
    return [mainString componentsSeparatedByString:tocan];
}

+(NSString *)performFormating:(float)value
{
    NSString *val = [NSString stringWithFormat:@"%.2f", value];
    
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSNumber *Number = @([val floatValue]);
    val = [self checkDecimals:[formatter stringForObjectValue:Number]];
    
    return [api_CommonMethods replaceStringwithString:val strTobeReplaced:@"$" stringReplaceWith:@""];
}

+(NSString *)checkDecimals:(NSString *)value
{
    if([api_CommonMethods StringContains:value smallString:@"."])
    {
        NSArray * array = [api_CommonMethods tocanizeTheString:value tocan:@"."];
        NSString *fraction = array[1];
        
        if((int)fraction.length == 1)
        {
            return [value stringByAppendingString:@"0"];
        }
        else
        {
            return value;
        }
    }
    else
    {
        return [value stringByAppendingString:@".00"];
    }
}

//==========================================================================================
// Google Map Functions
//==========================================================================================

+(NSString *)adressFromLatLon_New:(NSString *)lat Lon:(NSString *)lon
{
    NSString *urlString = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?latlng=%@,%@&sensor=true",lat,lon];
    
    NSMutableData * data = [[NSMutableData alloc] initWithContentsOfURL:[NSURL URLWithString:urlString]];
    
    NSError *error = nil;
    NSDictionary *resultsDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if([resultsDictionary[@"results"] count])
    {
        
        return resultsDictionary[@"results"][0][@"formatted_address"];
    }
    else
    {
        return @"Address not found";
    }
    
}
+(NSString *)latlonfromAddress_New:(NSString *)address
{
    if([api_CommonMethods StringContains:address smallString:@"(null)"])
    {
        return @"0,0";
    }
    else
    {
        NSString *urlString = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/xml?address=%@&sensor=true",address];
        urlString=[api_CommonMethods removeSpaces:urlString];
        NSString *locationString = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlString] encoding:NSUTF8StringEncoding error:nil];
        if([api_CommonMethods StringContains:locationString smallString:@"<location>"])
        {
            NSString *returnedSubStr = [api_CommonMethods returnSubstringbyValue:@"<location>" str2:@"</location>" string:locationString];
            NSString *latlonStr = [NSString stringWithFormat:@"%@,%@",[api_CommonMethods returnSubstringbyValue:@"<lat>" str2:@"</lat>" string:returnedSubStr],[api_CommonMethods returnSubstringbyValue:@"<lng>" str2:@"</lng>" string:returnedSubStr]];
            return latlonStr;
        }
        else
        {
            return @"0,0";
        }
    }
}
+(NSArray *) sortArray :(NSMutableArray *)array
{
    NSSortDescriptor *hopProfileDescriptor =
    [[NSSortDescriptor alloc] initWithKey:@"distance"
                                ascending:YES];
    
    NSArray *descriptors = [NSArray arrayWithObjects:hopProfileDescriptor, nil];
    NSArray *sortedArray = [array sortedArrayUsingDescriptors:descriptors];
    
    return sortedArray;
}
//==========================================================================================
// Mobile Model Detection
//==========================================================================================

+(NSInteger)DeviceModel
{
    if([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone)
    {
        if ([[UIScreen mainScreen] bounds].size.height == 480)
        {
            return 1;
        }
        else
        {
            return 2;
        }
    }
    else
    {
        return 3;
    }
    
}

//==========================================================================================
// CSV Parser
//==========================================================================================

+ (NSMutableArray *)CSVParser:(NSString *)string
{
    NSMutableArray *rows = [NSMutableArray array];
    
    // Get newline character set
    NSMutableCharacterSet *newlineCharacterSet = (id)[NSMutableCharacterSet whitespaceAndNewlineCharacterSet];
    [newlineCharacterSet formIntersectionWithCharacterSet:[[NSCharacterSet whitespaceCharacterSet] invertedSet]];
    
    // Characters that are important to the parser
    NSMutableCharacterSet *importantCharactersSet = (id)[NSMutableCharacterSet characterSetWithCharactersInString:@"\""];
    [importantCharactersSet formUnionWithCharacterSet:newlineCharacterSet];
    
    // Create scanner, and scan string
    NSScanner *scanner = [NSScanner scannerWithString:string];
    [scanner setCharactersToBeSkipped:nil];
    while ( ![scanner isAtEnd] ) {
        BOOL insideQuotes = NO;
        BOOL finishedRow = NO;
        NSMutableArray *columns = [NSMutableArray arrayWithCapacity:10];
        NSMutableString *currentColumn = [NSMutableString string];
        while ( !finishedRow ) {
            NSString *tempString;
            if ( [scanner scanUpToCharactersFromSet:importantCharactersSet intoString:&tempString] ) {
                [currentColumn appendString:tempString];
            }
            
            if ( [scanner isAtEnd] ) {
                if ( ![currentColumn isEqualToString:@""] ) [columns addObject:currentColumn];
                finishedRow = YES;
            }
            else if ( [scanner scanCharactersFromSet:newlineCharacterSet intoString:&tempString] ) {
                if ( insideQuotes ) {
                    // Add line break to column text
                    [currentColumn appendString:tempString];
                }
                else {
                    // End of row
                    if ( ![currentColumn isEqualToString:@""] ) [columns addObject:currentColumn];
                    finishedRow = YES;
                }
            }
            else if ( [scanner scanString:@"\"" intoString:NULL] ) {
                if ( insideQuotes && [scanner scanString:@"\"" intoString:NULL] ) {
                    // Replace double quotes with a single quote in the column string.
                    [currentColumn appendString:@"\""];
                }
                else {
                    // Start or end of a quoted string.
                    insideQuotes = !insideQuotes;
                }
            }
            else if ( [scanner scanString:@"," intoString:NULL] ) {
                if ( insideQuotes ) {
                    [currentColumn appendString:@","];
                }
                else {
                    // This is a column separating comma
                    [columns addObject:currentColumn];
                    currentColumn = [NSMutableString string];
                    [scanner scanCharactersFromSet:[NSCharacterSet whitespaceCharacterSet] intoString:NULL];
                }
            }
        }
        if ( [columns count] > 0 ) [rows addObject:columns];
    }
    
    return rows;
}

//==========================================================================================
// Tab Bar Functions
//==========================================================================================

+(void) showTabBar:(UITabBarController *) tabbarcontroller
{
    if([self DeviceModel] == 2)
    {
        for(UIView *view in tabbarcontroller.view.subviews)
        {
            if([view isKindOfClass:[UITabBar class]])
            {
                [view setFrame:CGRectMake(view.frame.origin.x, 519, view.frame.size.width, view.frame.size.height)];
                
            }
            else
            {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 519)];
            }
        }
    }
    else if([self DeviceModel] == 1)
    {
        for(UIView *view in tabbarcontroller.view.subviews)
        {
            if([view isKindOfClass:[UITabBar class]])
            {
                [view setFrame:CGRectMake(view.frame.origin.x, 431, view.frame.size.width, view.frame.size.height)];
                
            }
            else {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 431)];
            }
        }
    }
}

+ (void) hideTabBar:(UITabBarController *) tabbarcontroller
{
    if([self DeviceModel] == 2)
    {
        for(UIView *view in tabbarcontroller.view.subviews)
        {
            if([view isKindOfClass:[UITabBar class]]) {
                [view setFrame:CGRectMake(view.frame.origin.x, 568, view.frame.size.width, view.frame.size.height)];
            }
            else {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 568)];
            }
        }
    }
    if([self DeviceModel] == 1)
    {
        for(UIView *view in tabbarcontroller.view.subviews)
        {
            if([view isKindOfClass:[UITabBar class]])
            {
                [view setFrame:CGRectMake(view.frame.origin.x, 480, view.frame.size.width, view.frame.size.height)];
            }
            else
            {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 480)];
            }
        }
    }
}

//==========================================================================================
// Calender Functions
//==========================================================================================

+(NSMutableArray *)get_Start_End_Day_OfWeek:(NSDate *)date
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *weekdayComponents     = [gregorian components:NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:date];
    
    NSDateComponents *componentsToSubtract  = [[NSDateComponents alloc] init];
    [componentsToSubtract setDay: (0 - [weekdayComponents weekday]) + 2];
    [componentsToSubtract setHour: 0 - [weekdayComponents hour]];
    [componentsToSubtract setMinute: 0 - [weekdayComponents minute]];
    [componentsToSubtract setSecond: 0 - [weekdayComponents second]];
    
    NSDate *beginningOfWeek = [gregorian dateByAddingComponents:componentsToSubtract toDate:date options:0];
    
    NSDateComponents *componentsToAdd = [gregorian components:NSDayCalendarUnit fromDate:beginningOfWeek];
    [componentsToAdd setDay:6];
    
    NSDate *endOfWeek = [gregorian dateByAddingComponents:componentsToAdd toDate:beginningOfWeek options:0];
    
    return [[NSMutableArray alloc] initWithObjects:beginningOfWeek, endOfWeek, nil];
}


+(NSDate *)getLastDateOfMonth:(NSDate *)date
{
    NSCalendar *gregCalendar=[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components=[gregCalendar components:NSMonthCalendarUnit|NSYearCalendarUnit fromDate:date];
    NSInteger month=[components month];
    NSInteger year=[components year];
    
    if (month==12)
    {
        [components setYear:year+1];
        [components setMonth:1];
    } else
    {
        [components setMonth:month+1];
    }
    [components setDay:1];
    
    return (NSDate *)[[gregCalendar dateFromComponents:components] dateByAddingTimeInterval:-86400];
}

+(NSDate *)getStartingDateOfMonth:(NSDate *)date
{
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents * currentDateComponents = [calendar components: NSYearCalendarUnit | NSMonthCalendarUnit fromDate: date];
    return  [calendar dateFromComponents: currentDateComponents];
}

+(NSInteger)getWeekNo:(NSDate *)date
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSWeekCalendarUnit fromDate:date];
    return [components weekOfMonth];
}

+(NSDate *)getNextDay:(NSDate *)date
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
    NSDateComponents* components = [[NSDateComponents alloc] init];
    components.day = 1;
    
    return [calendar dateByAddingComponents: components toDate:date options: 0];
}

+(NSDate *)getPreviousDay:(NSDate *)date
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
    NSDateComponents* components = [[NSDateComponents alloc] init];
    components.day = -1;
    
    return [calendar dateByAddingComponents:components toDate:date options: 0];
}

+(NSInteger)getWeeks:(NSDate *)date
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-YYYY"];
    
    NSArray * array = [self tocanizeTheString:[formatter stringFromDate:date] tocan:@"-"];
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear: [array[1] intValue]];
    [dateComponents setMonth: [array[0] intValue]];
    [dateComponents setDay:  1];
    
    NSDate *tempDate = [currentCalendar dateFromComponents: dateComponents];
    NSRange range = [currentCalendar rangeOfUnit: NSWeekCalendarUnit
                                          inUnit: NSMonthCalendarUnit
                                         forDate: tempDate];
    
    //NSLog(@"GregorianCalendar Date: %@", tempDate);
    return range.length;
}

//==================================================
//Color of a pixel and inverse color of given color
//==================================================
+ (UIColor *) inverseColor: (UIColor *)GivenColor
{
    
    CGColorRef oldCGColor = GivenColor.CGColor;
    
    NSInteger numberOfComponents = CGColorGetNumberOfComponents(oldCGColor);
    
    // can not invert - the only component is the alpha
    // e.g. self == [UIColor groupTableViewBackgroundColor]
    if (numberOfComponents == 1) {
        return [UIColor colorWithCGColor:oldCGColor];
    }
    
    const CGFloat *oldComponentColors = CGColorGetComponents(oldCGColor);
    CGFloat newComponentColors[numberOfComponents];
    
    NSInteger i = numberOfComponents - 1;
    newComponentColors[i] = oldComponentColors[i]; // alpha
    while (--i >= 0) {
        newComponentColors[i] = 1 - oldComponentColors[i];
    }
    
    CGColorRef newCGColor = CGColorCreate(CGColorGetColorSpace(oldCGColor), newComponentColors);
    UIColor *newColor = [UIColor colorWithCGColor:newCGColor];
    CGColorRelease(newCGColor);
    
    return newColor;
}
+ (UIColor*) getPixelColorAtLocation:(CGPoint)point Image:(UIImage *)image
{
    UIColor* color = nil;
    CGImageRef inImage = image.CGImage;
    // Create off screen bitmap context to draw the image into. Format ARGB is 4 bytes for each pixel: Alpa, Red, Green, Blue
    CGContextRef cgctx = [self createARGBBitmapContextFromImage:inImage];
    if (cgctx == NULL) { return nil; /* error */ }
    
    size_t w = CGImageGetWidth(inImage);
    size_t h = CGImageGetHeight(inImage);
    CGRect rect = {{0,0},{w,h}};
    
    // Draw the image to the bitmap context. Once we draw, the memory
    // allocated for the context for rendering will then contain the
    // raw image data in the specified color space.
    CGContextDrawImage(cgctx, rect, inImage);
    
    // Now we can get a pointer to the image data associated with the bitmap
    // context.
    unsigned char* data = CGBitmapContextGetData (cgctx);
    if (data != NULL) {
        //offset locates the pixel in the data from x,y.
        //4 for 4 bytes of data per pixel, w is width of one row of data.
        int offset = 4*((w*round(point.y))+round(point.x));
        int alpha =  data[offset];
        int red = data[offset+1];
        int green = data[offset+2];
        int blue = data[offset+3];
        NSLog(@"offset: %i colors: RGB A %i %i %i  %i",offset,red,green,blue,alpha);
        color = [UIColor colorWithRed:(red/255.0f) green:(green/255.0f) blue:(blue/255.0f) alpha:(alpha/255.0f)];
    }
    
    // When finished, release the context
    CGContextRelease(cgctx);
    // Free image data memory for the context
    if (data) { free(data); }
    
    return color;
}



+ (CGContextRef) createARGBBitmapContextFromImage:(CGImageRef) inImage
{
    
    CGContextRef    context = NULL;
    CGColorSpaceRef colorSpace;
    void *          bitmapData;
    NSInteger             bitmapByteCount;
    NSInteger             bitmapBytesPerRow;
    
    // Get image width, height. We'll use the entire image.
    size_t pixelsWide = CGImageGetWidth(inImage);
    size_t pixelsHigh = CGImageGetHeight(inImage);
    
    // Declare the number of bytes per row. Each pixel in the bitmap in this
    // example is represented by 4 bytes; 8 bits each of red, green, blue, and
    // alpha.
    bitmapBytesPerRow   = (pixelsWide * 4);
    bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);
    
    // Use the generic RGB color space.
    colorSpace = CGColorSpaceCreateDeviceRGB();
    
    if (colorSpace == NULL)
    {
        fprintf(stderr, "Error allocating color space\n");
        return NULL;
    }
    
    // Allocate memory for image data. This is the destination in memory
    // where any drawing to the bitmap context will be rendered.
    bitmapData = malloc( bitmapByteCount );
    if (bitmapData == NULL)
    {
        fprintf (stderr, "Memory not allocated!");
        CGColorSpaceRelease( colorSpace );
        return NULL;
    }
    
    // Create the bitmap context. We want pre-multiplied ARGB, 8-bits
    // per component. Regardless of what the source image format is
    // (CMYK, Grayscale, and so on) it will be converted over to the format
    // specified here by CGBitmapContextCreate.
    context = CGBitmapContextCreate (bitmapData,
                                     pixelsWide,
                                     pixelsHigh,
                                     8,      // bits per component
                                     bitmapBytesPerRow,
                                     colorSpace,
                                     (CGBitmapInfo) kCGImageAlphaPremultipliedFirst);
    if (context == NULL)
    {
        free (bitmapData);
        fprintf (stderr, "Context not created!");
    }
    
    // Make sure and release colorspace before returning
    CGColorSpaceRelease( colorSpace );
    
    return context;
}
+(BOOL) IsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

+(NSIndexPath *)returnIndexPathofSender:(id)sender fromTableView:(UITableView *)tableView
{
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:tableView];
    NSIndexPath *indexPath = [tableView indexPathForRowAtPoint:buttonPosition];
    return indexPath;
}
#pragma mark -
#pragma mark AlertControllers
+(UIAlertController *)simpleAlertController:(NSString *)title message:(NSString *)message handler:(void (^ _Nullable)(UIAlertAction *))myHandler
{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:myHandler];
    [controller addAction:okAction];
    return controller;
}
+(void)showSimpleAlertController:(NSString *)title message:(NSString *)message handler:(void (^)(UIAlertAction * _Nullable))myHandler
{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:myHandler];
    [controller addAction:okAction];
    [[self topViewController ]presentViewController:controller animated:YES completion:nil];

}
+(void)showAlertControllerWithYesNoOptions:(NSString *)title message:(NSString *)message yesHandler:(void (^)(UIAlertAction * _Nullable))yesHandler noHandler:(void (^)(UIAlertAction * _Nullable))noHandler
{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:yesHandler];
    [controller addAction:yesAction];
    
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:noHandler];
    [controller addAction:noAction];
    
    [[self topViewController ]presentViewController:controller animated:YES completion:nil];

}
+(void)showAlertControllerWith2Options:(NSString *)title message:(NSString *)message Option1:(NSString *)option1 option2:(NSString *)option2 option1Handler:(void (^)(UIAlertAction * _Nullable))option1Handler option2Handler:(void (^)(UIAlertAction * _Nullable))option2Handler
{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *option1Action = [UIAlertAction actionWithTitle:option1 style:UIAlertActionStyleDefault handler:option1Handler];
    [controller addAction:option1Action];
    
    UIAlertAction *option2Action = [UIAlertAction actionWithTitle:option2 style:UIAlertActionStyleDefault handler:option2Handler];
    [controller addAction:option2Action];
    
    [[self topViewController ]presentViewController:controller animated:YES completion:nil];

}
#pragma mark -
#pragma mark Input Alert controller
+(void)showInputAlertwithTitle:(NSString *)title message:(NSString *)message okButttonTitle:(NSString *)buttonTitle cancelButtonTitle:(NSString *)cancelButtonTitle numberofTextFields:(NSInteger)number textfieldRetuner:(void (^)(NSInteger, UITextField * _Nonnull))textFieldReturner okButtonAction:(void (^)(UIAlertAction * _Nullable, NSArray * _Nonnull))okHandler cancelButtonAction:(void (^)(UIAlertAction * _Nullable, NSArray * _Nullable))cancelHandler
{
    UIAlertController *alertController   = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelHandler) {
            cancelHandler (action,alertController.textFields);
        }
    }];
    UIAlertAction *sendAction = [UIAlertAction actionWithTitle:buttonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (okHandler) {
            okHandler(action,alertController.textFields);
        }
    }];
    for (int i = 0; i<number; i++) {
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textFieldReturner(i,textField);
        }];
    }
    
    
    [alertController addAction:cancelAction];
    [alertController addAction:sendAction];
    [[self topViewController ]presentViewController:alertController animated:YES completion:nil];

    

}
#pragma mark -
#pragma mark topController

+(UIViewController*)topViewController {
    return [self topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

+(UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}

@end
