//
//  GithubRequestRequestManager.h
//  Stackoverflow
//
//  Created by Pau on 16/02/2016.
//

#import <Foundation/Foundation.h>
#import "EntryParams.h"

typedef void(^EntryParamsBlock)(NSArray <EntryParams * > *entries, NSError *error);
typedef void(^ContributorsBlock)(NSArray <NSString * > * contributors, NSError *error);
typedef void(^IssuesBlock)(NSArray <NSString * > * issues, NSError *error);

@interface GithubRequestRequestManager : NSObject

/*
 @method getEntriesForQuery
 @abstract Sends an async request in order to retrieve Github entries for a given language.
 @param query Query with the desired language
 @param doneBlock The Completion block with the response and any possible error.
 */
+ (void)getEntriesForQuery:(NSString *)language done:(EntryParamsBlock)doneBlock;

/*
 @method getContributorsFor
 @abstract Sends an async request in order to retrieve contributors for a given repository.
 @param query Query with the desired language
 @param doneBlock The Completion block with the response and any possible error.
 */
+ (void)getContributorsFor:(NSString *)owner repo:(NSString *)repo done:(ContributorsBlock)doneBlock;

/*
 @method getIssuesFor
 @abstract Sends an async request in order to retrieve issues for a given repository.
 @param query Query with the desired language
 @param doneBlock The Completion block with the response and any possible error.
 */
+ (void)getIssuesFor:(NSString *)owner repo:(NSString *)repo done:(IssuesBlock)doneBlock;

@end
