//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length {

    NSMutableArray *hold = [[NSMutableArray alloc]init];
    
    if ([location[@"name"] length] > length) {
    NSString *string = [location[@"name"] substringToIndex:length];
    NSLog(@"What is the string: %@", string);
    NSLog(@"Let's check the length: %lu", length);
        [hold addObject:string];
    }
    else {
        NSString *string = location[@"name"];
        [hold addObject:string];
    }
    
    NSString *outsideString = [hold firstObject];
    
    return outsideString;
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    
    NSDictionary *newDict = [[NSDictionary alloc] initWithObjectsAndKeys:name, @"name", @(latitude), @"latitude", @(longitude), @"longitude", nil];
    
    //NSLog(@"Look at dictionary: %@", newDict);
    return newDict;
}

- (NSArray *)namesOfLocations:(NSArray *)locations {
    
   NSArray *locationsForKey = [locations valueForKey:@"name"];
    //NSLog(@"Look at the arrya: %@", locationsForKey);
    return locationsForKey;
}

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary {
    
   // NSArray *allKeys = [dictionary allKeys];
  //  NSUInteger b = [allKeys count];
   
    //NSLog(@"Check dictionary keys: %@", allKeys);
   // NSLog(@"Number of keys: %lu", b);
    
    BOOL answer = ([[dictionary allKeys] containsObject:@"name" ] && [[dictionary allKeys] containsObject:@"latitude"] && [[dictionary allKeys] containsObject:@"longitude"] && ([[dictionary allKeys] count] == 3));
    
    return answer;
}

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {

    //NSLog(@"Locations: %@", locations);
    
    for (NSDictionary *dictionary in locations) {
        NSString *foundLocation = dictionary[@"name"];
    if ([foundLocation isEqualToString:name]) {
        return dictionary;
        }
    }
    return nil;
}

@end
