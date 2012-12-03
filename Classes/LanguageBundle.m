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


+ (NSString *)localizedStringForKey:(NSString *)key
{
    return [LanguageBundle localizedStringForKey:key value:key];
}


+ (NSString *)localizedStringForKey:(NSString *)key forLanguage:(NSString *)lang
{
    return [LanguageBundle localizedStringForKey:key value:key forLanguage:lang];
}


+ (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value
{
    NSString *lang = [[LanguageBundle mainBundle] currentLanguage];
    return [LanguageBundle localizedStringForKey:key value:value forLanguage:lang];
}


+ (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value forLanguage:(NSString *)lang
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

@implementation NSString (LanguageBundleString)

- (NSString *)localized
{
    return [LanguageBundle localizedStringForKey:self];
    
}


- (NSString *)localizedForLanguage:(NSString *)lang
{
    return [LanguageBundle localizedStringForKey:self forLanguage:lang];
}
@end
