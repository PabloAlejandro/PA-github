//
//  EntryParams.h
//  Github
//
//  Created by Pau on 16/02/2016.
//

#import <Foundation/Foundation.h>

@interface EntryParams : NSObject

@property (nonatomic, strong) NSString * type;
@property (nonatomic, strong) NSString * username;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * owner;
@property (nonatomic, strong) NSString * homepage;
@property (nonatomic, strong) NSString * description;
@property (nonatomic, strong) NSString * language;
@property (nonatomic, strong) NSString * url;
@property (nonatomic, strong) NSString * created;
@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSString * pushed_at;
@property (nonatomic, strong) NSString * pushed;

@property (nonatomic, strong) NSNumber * watchers;
@property (nonatomic, strong) NSNumber * followers;
@property (nonatomic, strong) NSNumber * forks;
@property (nonatomic, strong) NSNumber * size;
@property (nonatomic, strong) NSNumber * open_issues;
@property (nonatomic, strong) NSNumber * score;
@property (nonatomic, strong) NSNumber * has_downloads;
@property (nonatomic, strong) NSNumber * has_wiki;
@property (nonatomic, strong) NSNumber * fork;
@property (nonatomic, strong) NSNumber * private_git;

/*
 @method paramsFromDictionary
 @abstract Creates an EntryParams object with the dictionary information
 @param dictionary The dictionary containing the params information
 */
+ (EntryParams *)paramsFromDictionary:(NSDictionary *)dictionary;

/*
 @method paramsFromEntries
 @abstract Creates an array of EntryParams objects with the information of dictionaries in the array
 @param entries The array of dictionaries containing the params information
 */
+ (NSArray <EntryParams *> *)paramsFromEntries:(NSArray *)entries;

@end
