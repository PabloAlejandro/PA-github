//
//  GithubRequestRequestManager.m
//  Stackoverflow
//
//  Created by Pau on 16/02/2016.
//

#import "GithubRequestRequestManager.h"
#import "GithubRequestRequestController.h"
#import "NSDictionary+Utils.h"

static NSString * const kOrder = @"desc";
static NSString * const kSort = @"stars";

static NSString * const kRepositoriesKey = @"repositories";
static NSString * const kContributorsKey = @"login";
static NSString * const kIssuesKey = @"title";

@implementation GithubRequestRequestManager

+ (void)getEntriesForQuery:(NSString *)language done:(EntryParamsBlock)doneBlock
{
    GithubRequestRequestController *request = [GithubRequestRequestController new];
    request.timeout = 30;

    [request getEntriesForOrder:kOrder sort:kSort language:language completion:^(NSObject *object, NSError *error) {

        NSArray * entries = [(NSDictionary *)object arrayForKey:kRepositoriesKey];
        
        NSArray <EntryParams *> * params = [EntryParams paramsFromEntries:entries];

        dispatch_async(dispatch_get_main_queue(), ^{
            doneBlock(params, error);
        });
    }];
}

+ (void)getContributorsFor:(NSString *)owner repo:(NSString *)repo done:(ContributorsBlock)doneBlock
{
    GithubRequestRequestController *request = [GithubRequestRequestController new];
    request.timeout = 30;
    
    [request getContributorsFor:owner repo:repo completion:^(NSObject *object, NSError *error) {
        
        NSMutableArray * contributors = [NSMutableArray new];
        if([object isKindOfClass:[NSArray class]]) {
            for(NSDictionary * dictionary in (NSArray *)object) {
                [contributors addObject:[dictionary stringForKey:kContributorsKey]];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            doneBlock(contributors, error);
        });
    }];
}

+ (void)getIssuesFor:(NSString *)owner repo:(NSString *)repo done:(IssuesBlock)doneBlock
{
    GithubRequestRequestController *request = [GithubRequestRequestController new];
    request.timeout = 30;
    
    [request getIssuesFor:owner repo:repo completion:^(NSObject *object, NSError *error) {
        
        NSMutableArray * contributors = [NSMutableArray new];
        if([object isKindOfClass:[NSArray class]]) {
            for(NSDictionary * dictionary in (NSArray *)object) {
                [contributors addObject:[dictionary stringForKey:kIssuesKey]];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            doneBlock(contributors, error);
        });
    }];
}

@end
