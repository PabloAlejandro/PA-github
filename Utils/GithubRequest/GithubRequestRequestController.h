//
//  GithubRequestRequestController.h
//  Stackoverflow
//
//  Created by Pau on 16/02/2016.
//

#import <Foundation/Foundation.h>

typedef void(^ServerResponseBlock)(NSObject *object, NSError *error);

@interface GithubRequestRequestController : NSObject

/**
 * Timeout for requests
 */
@property float timeout;

/*
 @method getEntriesForOrder
 @abstract Sends an async request in order to retrieve entries.
 @param order The order param for the request
 @param sort The sort param for the request
 @param site The site param for the request
 @param doneBlock The Completion block with the response and any possible error.
 */
- (void)getEntriesForOrder:(NSString *)order sort:(NSString *)sort language:(NSString *)language completion:(ServerResponseBlock)doneBlock;

/*
 @method getContributorsFor
 @abstract Sends an async request in order to retrieve contributors for a repo
 @param owner Owner of the repo
 @param repo Name of the repo
 @param doneBlock The Completion block with the response and any possible error.
 */
- (void)getContributorsFor:(NSString *)owner repo:(NSString *)repo completion:(ServerResponseBlock)doneBlock;

/*
 @method getIssuesFor
 @abstract Sends an async request in order to retrieve issues for a repo
 @param owner Owner of the repo
 @param repo Name of the repo
 @param doneBlock The Completion block with the response and any possible error.
 */
- (void)getIssuesFor:(NSString *)owner repo:(NSString *)repo completion:(ServerResponseBlock)doneBlock;

@end
