//
//  LanguageBundle.m
//  LanguageBundle
//
//  Created by Jirat K on 8/20/55 BE.
//  Copyright (c) 2555 Allianz. All rights reserved.
//

#import "LanguageBundle.h"




@implementation LanguageBundle

@synthesize currentLanguage = _currentLanguage;


+ (LanguageBundle *)mainBundle
{
    static LanguageBundle *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[LanguageBundle alloc] init];
    });
    return sharedInstance;
}


+ (BOOL)setLanguage:(NSString *)lang
{
    [[self mainBundle] setCurrentLanguage:lang];
    return YES;
}


+ (NSString *)localizableStringForKey:(NSString *)key
{
    return [LanguageBundle localizableStringForKey:key value:key];
}


+ (NSString *)localizableStringForKey:(NSString *)key forLanguage:(NSString *)lang
{
    return [LanguageBundle localizableStringForKey:key value:key forLanguage:lang];
}


+ (NSString *)localizableStringForKey:(NSString *)key value:(NSString *)value
{
    NSString *lang = [[LanguageBundle mainBundle] currentLanguage];
    return [LanguageBundle localizableStringForKey:key value:value forLanguage:lang];
}


+ (NSString *)localizableStringForKey:(NSString *)key value:(NSString *)value forLanguage:(NSString *)lang
{
    if ([key isEqualToString:@""]
        || [[key stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0 ) {
        return @"";
    }
    

    
    NSString *path = [[NSBundle mainBundle] pathForResource:lang ofType:@"lproj"];
    
    NSBundle *_tempBundle = [NSBundle bundleWithPath:path];
    
    if (!_tempBundle) {
        return @"";
    }
    
    return [_tempBundle localizedStringForKey:key value:value table:nil];
}

@end
