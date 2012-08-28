//
//  JKLanguageBundleTests.m
//  JKLanguageBundleTests
//
//  Created by Jirat K on 8/28/55 BE.
//  Copyright (c) 2555 Allianz. All rights reserved.
//

#import "JKLanguageBundleTests.h"
#import "LanguageBundle.h"

@implementation JKLanguageBundleTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testSingleKeyWithExistKey
{
    [LanguageBundle setLanguage:@"en"];
    NSString *helloWord = [LanguageBundle localizableStringForKey:@"common_hello"];
    STAssertEqualObjects(helloWord ,@"Hello", @"");
    
    [LanguageBundle setLanguage:@"fr"];
    NSString *frHello = [LanguageBundle localizableStringForKey:@"common_hello"];
    STAssertEqualObjects(frHello, @"Bonjour", @"");
    
    [LanguageBundle setLanguage:@"es"];
    NSString *esHello = [LanguageBundle localizableStringForKey:@"common_hello"];
    STAssertEqualObjects(esHello, @"Hola", @"");
}

@end
