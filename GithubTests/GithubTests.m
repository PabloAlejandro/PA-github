//
//  GithubTests.m
//  GithubTests
//
//  Created by Pau on 16/02/2016.
//

#import <XCTest/XCTest.h>
#import "EntryParams.h"

@interface GithubTests : XCTestCase

@end

@implementation GithubTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEntryParams {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSDictionary * dictionary = @{
                                  @"type": @"repo",
                                  @"username": @"apple",
                                  @"name": @"swift",
                                  @"owner": @"apple",
                                  @"homepage": @"https://swift.org/",
                                  @"description": @"The Swift Programming Language",
                                  @"language": @"C++",
                                  @"watchers": @26724,
                                  @"followers": @26724,
                                  @"forks": @3421,
                                  @"size": @114239,
                                  @"open_issues": @58,
                                  @"score": @115.78078,
                                  @"has_downloads": [NSNumber numberWithBool:true],
                                  @"has_issues": [NSNumber numberWithBool:true],
                                  @"has_wiki": [NSNumber numberWithBool:true],
                                  @"fork": [NSNumber numberWithBool:true],
                                  @"private": [NSNumber numberWithBool:true],
                                  @"url": @"https://github.com/apple/swift",
                                  @"created": @"2015-10-23T21:15:07Z",
                                  @"created_at": @"2015-10-23T21:15:07Z",
                                  @"pushed_at": @"2016-02-16T17:15:50Z",
                                  @"pushed": @"2016-02-16T17:15:50Z"
                                  };
    
    EntryParams * params = [EntryParams paramsFromDictionary:dictionary];
    
    NSAssert(params != nil, @"params should be nil");
}

- (void)testEntryParamsArray {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSArray * array = @[@{
                            @"type": @"repo",
                            @"username": @"apple",
                            @"name": @"swift",
                            @"owner": @"apple",
                            @"homepage": @"https://swift.org/",
                            @"description": @"The Swift Programming Language",
                            @"language": @"C++",
                            @"watchers": @26724,
                            @"followers": @26724,
                            @"forks": @3421,
                            @"size": @114239,
                            @"open_issues": @58,
                            @"score": @115.78078,
                            @"has_downloads": [NSNumber numberWithBool:true],
                            @"has_issues": [NSNumber numberWithBool:true],
                            @"has_wiki": [NSNumber numberWithBool:true],
                            @"fork": [NSNumber numberWithBool:true],
                            @"private": [NSNumber numberWithBool:true],
                            @"url": @"https://github.com/apple/swift",
                            @"created": @"2015-10-23T21:15:07Z",
                            @"created_at": @"2015-10-23T21:15:07Z",
                            @"pushed_at": @"2016-02-16T17:15:50Z",
                            @"pushed": @"2016-02-16T17:15:50Z"
                            },
                        @{
                            @"type": @"repo",
                            @"username": @"apple",
                            @"name": @"swift",
                            @"owner": @"apple",
                            @"homepage": @"https://swift.org/",
                            @"description": @"The Swift Programming Language",
                            @"language": @"C++",
                            @"watchers": @26724,
                            @"followers": @26724,
                            @"forks": @3421,
                            @"size": @114239,
                            @"open_issues": @58,
                            @"score": @115.78078,
                            @"has_downloads": [NSNumber numberWithBool:true],
                            @"has_issues": [NSNumber numberWithBool:true],
                            @"has_wiki": [NSNumber numberWithBool:true],
                            @"fork": [NSNumber numberWithBool:true],
                            @"private": [NSNumber numberWithBool:true],
                            @"url": @"https://github.com/apple/swift",
                            @"created": @"2015-10-23T21:15:07Z",
                            @"created_at": @"2015-10-23T21:15:07Z",
                            @"pushed_at": @"2016-02-16T17:15:50Z",
                            @"pushed": @"2016-02-16T17:15:50Z"
                            }
                        ];
    
    NSArray * resultArray = [EntryParams paramsFromEntries:array];
    
    NSAssert(resultArray != nil, @"resultArray should be nil");
    NSAssert(resultArray.count == 2, @"resultArray should contain 2 objects");
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
