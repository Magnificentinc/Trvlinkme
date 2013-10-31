//
//  NetrahtmlStripper.m
//  Netra
//
//  Created by Arie on 10/27/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "NetrahtmlStripper.h"


@interface NSString_stripHtml_XMLParsee : NSObject<NSXMLParserDelegate> {
@private
    NSMutableArray* strings;
}
- (NSString*)getCharsFound;
@end

@implementation NSString_stripHtml_XMLParsee
- (id)init {
    if((self = [super init])) {
        strings = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)parser:(NSXMLParser*)parser foundCharacters:(NSString*)string {
    [strings addObject:string];
}
- (NSString*)getCharsFound {
    return [strings componentsJoinedByString:@""];
}
@end

@implementation NSString (stripHtml)
- (NSString*)netraStripHtml {
  
	NSString* string = [NSString stringWithFormat:@"<root>%@</root>", self];

	
    NSStringEncoding encoding = string.fastestEncoding;
    NSData* data = [string dataUsingEncoding:encoding];
    NSXMLParser* parser = [[NSXMLParser alloc] initWithData:data];

    NSString_stripHtml_XMLParsee* netra_parse = [[NSString_stripHtml_XMLParsee alloc] init];
    parser.delegate = netra_parse;
    [parser parse];
    
    NSString* strippedString = [netra_parse getCharsFound];

    return strippedString;
}
@end
