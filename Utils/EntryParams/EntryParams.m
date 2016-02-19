//
//  EntryParams.m
//  Github
//
//  Created by Pau on 16/02/2016.
//

#import "EntryParams.h"
#import "NSDictionary+Utils.h"

@implementation EntryParams

@synthesize type;
@synthesize username;
@synthesize name;
@synthesize owner;
@synthesize homepage;
@synthesize description;
@synthesize language;
@synthesize url;
@synthesize created;
@synthesize created_at;
@synthesize pushed_at;
@synthesize pushed;

@synthesize watchers;
@synthesize followers;
@synthesize forks;
@synthesize size;
@synthesize open_issues;
@synthesize score;
@synthesize has_downloads;
@synthesize has_wiki;
@synthesize fork;
@synthesize private_git;

+ (EntryParams *)paramsFromDictionary:(NSDictionary *)dictionary
{
    if(dictionary == nil) {
        return nil;
    }
    
    EntryParams *params = [EntryParams new];
    
    params.type = [dictionary stringForKey:@"type"];
    params.username = [dictionary stringForKey:@"username"];
    params.name = [dictionary stringForKey:@"name"];
    params.owner = [dictionary stringForKey:@"owner"];
    params.homepage = [dictionary stringForKey:@"homepage"];
    params.description = [dictionary stringForKey:@"description"];
    params.language = [dictionary stringForKey:@"language"];
    params.url = [dictionary stringForKey:@"url"];
    params.created = [dictionary stringForKey:@"created"];
    params.created_at = [dictionary stringForKey:@"created_at"];
    params.pushed_at = [dictionary stringForKey:@"pushed_at"];
    params.pushed = [dictionary stringForKey:@"pushed"];
    params.watchers = [dictionary numberForKey:@"watchers"];
    params.followers = [dictionary numberForKey:@"followers"];
    params.forks = [dictionary numberForKey:@"forks"];
    params.size = [dictionary numberForKey:@"size"];
    params.open_issues = [dictionary numberForKey:@"open_issues"];
    params.score = [dictionary numberForKey:@"score"];
    params.has_downloads = [dictionary numberForKey:@"has_downloads"];
    params.has_wiki = [dictionary numberForKey:@"has_wiki"];
    params.fork = [dictionary numberForKey:@"fork"];
    params.private_git = [dictionary numberForKey:@"private_git"];
    
    return params;
}

+ (NSArray <EntryParams *> *)paramsFromEntries:(NSArray *)entries
{
    NSMutableArray * paramsArray = [NSMutableArray new];
    for(NSDictionary *dictionary in entries) {
        EntryParams * params = [self paramsFromDictionary:dictionary];
        if(params) {
            [paramsArray addObject:params];
        }
    }
    return paramsArray;
}

@end
