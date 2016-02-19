//
//  DashboardSearchController.h
//  Github
//
//  Created by Pau on 16/02/2016.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol DashboardSearchControllerDelegate <NSObject>

- (void)dashboardSearchControllerDidType:(NSString *)search;

@end

@interface DashboardSearchController : NSObject <UISearchBarDelegate>

@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;
@property (nonatomic, weak) IBOutlet id <DashboardSearchControllerDelegate> delegate;

@end
