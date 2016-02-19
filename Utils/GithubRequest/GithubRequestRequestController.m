//
//  GithubRequestRequestController.m
//  Stackoverflow
//
//  Created by Pau on 16/02/2016.
//

#import "GithubRequestRequestController.h"

// NSURLRequest utils
#import "ServerRequestUtils.h"

// Factory requests
#import "NetworkFactoryRequests.h"

static NSString * const kLanguageSearchEndpoint = @"https://api.github.com/legacy/repos/search/";
static NSString * const kEndpoint = @"https://api.github.com/repos/";

@implementation GithubRequestRequestController  {
    NSOperationQueue *queue;
}

@synthesize timeout;

- (id)init {
    if ((self = [super init])) {
        
        timeout = 60;
        queue = [NSOperationQueue new];
        [queue setName:@"StackoverflowRequestControllerQueue"];
    }
    return self;
}

- (NSString *)getLanguageSearchEndpoint
{
    return kLanguageSearchEndpoint;
}

- (NSString *)getEndpoint
{
    return kEndpoint;
}

- (void)getEntriesForOrder:(NSString *)order sort:(NSString *)sort language:(NSString *)language completion:(ServerResponseBlock)doneBlock {
    
    NSString *url = [NSString stringWithFormat:@"%@%@?", [self getLanguageSearchEndpoint], language];
    url = [ServerRequestUtils addSort:sort toRequest:url];
    url = [ServerRequestUtils addOrder:order toRequest:url];
    url = [ServerRequestUtils addLanguage:language toRequest:url];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSMutableURLRequest *request = [ServerRequestUtils newRequestWithUrl:url timeoutInterval:timeout shouldHandleCookies:NO];
        
        [[NetworkFactoryRequests sharedInstance] sendAsynchronousRequest:request
                                                                   queue:queue
                                                       completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                                                           
                                                           if (error != nil) {
                                                               doneBlock(nil, error);
                                                           }
                                                           else {
                                                               [ServerRequestUtils processData:data done:doneBlock];
                                                           }
                                                       }];
    });
}


- (void)getContributorsFor:(NSString *)owner repo:(NSString *)repo completion:(ServerResponseBlock)doneBlock {
    
    NSString *url = [NSString stringWithFormat:@"%@%@/%@/contributors", [self getEndpoint], owner, repo];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSMutableURLRequest *request = [ServerRequestUtils newRequestWithUrl:url timeoutInterval:timeout shouldHandleCookies:NO];
        
        [[NetworkFactoryRequests sharedInstance] sendAsynchronousRequest:request
                                                                   queue:queue
                                                       completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                                                           
                                                           if (error != nil) {
                                                               doneBlock(nil, error);
                                                           }
                                                           else {
                                                               [ServerRequestUtils processData:data done:doneBlock];
                                                           }
                                                       }];
    });
}

- (void)getIssuesFor:(NSString *)owner repo:(NSString *)repo completion:(ServerResponseBlock)doneBlock {
    
    NSString *url = [NSString stringWithFormat:@"%@%@/%@/issues", [self getEndpoint], owner, repo];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSMutableURLRequest *request = [ServerRequestUtils newRequestWithUrl:url timeoutInterval:timeout shouldHandleCookies:NO];
        
        [[NetworkFactoryRequests sharedInstance] sendAsynchronousRequest:request
                                                                   queue:queue
                                                       completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                                                           
                                                           if (error != nil) {
                                                               doneBlock(nil, error);
                                                           }
                                                           else {
                                                               [ServerRequestUtils processData:data done:doneBlock];
                                                           }
                                                       }];
    });
}

@end
