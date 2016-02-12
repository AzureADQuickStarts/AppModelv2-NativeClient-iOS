#import <Foundation/Foundation.h>
#import "samplesTaskItem.h"
#import "samplesPolicyData.h"
#import "ADALiOS/ADAuthenticationResult.h"
#import "SamplesApplicationData.h"


@implementation SamplesApplicationData

+(id) getInstance
{
    static SamplesApplicationData *instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"settings" ofType:@"plist"]];
        NSString* va = [dictionary objectForKey:@"fullScreen"];
        NSString* sc = [dictionary objectForKey:@"showClaims"];
        instance.fullScreen = [va boolValue];
        instance.showClaims = [sc boolValue];
        instance.clientId = [dictionary objectForKey:@"clientId"];
        instance.authority = [dictionary objectForKey:@"authority"];
        instance.responseMode = [dictionary objectForKey:@"response_mode"];
        instance.resourceId = [dictionary objectForKey:@"resourceString"];
        instance.scopes = [[NSMutableArray alloc]initWithArray:[dictionary objectForKey:@"scopes"]];
        instance.additionalScopes = [dictionary objectForKey:@"additionalScopes"];
        instance.redirectUriString = [dictionary objectForKey:@"redirectUri"];
        instance.prompt = [dictionary objectForKey:@"prompt"];
        instance.taskWebApiUrlString = [dictionary objectForKey:@"taskWebAPI"];
        instance.correlationId = [dictionary objectForKey:@"correlationId"];
        
    });
    
    return instance;
}

@end