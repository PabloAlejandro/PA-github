//
//  DashboardSearchController.m
//  Github
//
//  Created by Pau on 16/02/2016.
//

#import "DashboardSearchController.h"

@implementation DashboardSearchController

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    if(self.delegate) {
        [self.delegate dashboardSearchControllerDidType:searchBar.text];
    }
}

@end
