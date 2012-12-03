

#import <Foundation/Foundation.h>



/*!
 @class LanguageBundle
 @discussion This is a discussion.
 It can span many lines or paragraphs.
 */
@interface LanguageBundle : NSObject


/*!
 @property currentLanguage
 Setup Language
 */
@property (nonatomic, copy) NSString *currentLanguage;


// Setup Language


/*!
 Set up Language for LanguageBundle
 @param lang
 Language Code for Set
 */
+ (BOOL)setLanguage:(NSString *)lang;


// Main Function

/*!
 String for key
 @param key
 key of String of your localizable
 */
+ (NSString *)localizedStringForKey:(NSString *)key;


/*!
 return string with default value
 @param key
 key of String of your localizable
 @param value
 default value if key not exists in current language
 */
+ (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value;



// Intermediate language

/*!
 Return String in intermediate language
 @param key
 key of String of your localizable
 @param lang
 return langauge
 */
+ (NSString *)localizedStringForKey:(NSString *)key forLanguage:(NSString *)lang;


/*!
 eturn String in intermediate language with default value
 @param key
 Language Code for Set
 @param value
 default value if key not exists in current language
 @param lang
 return langauge
 */
+ (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value forLanguage:(NSString *)lang;

@end


@interface NSString (LanguageBundleString)

- (NSString *)localized;
- (NSString *)localizedForLanguage:(NSString *)lang;

@end





