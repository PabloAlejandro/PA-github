//
//  DashboardViewController.m
//  Github
//
//  Created by Pau on 16/02/2016.
//

#import "DashboardViewController.h"
#import "GithubRequestRequestManager.h"
#import "DashboardTableController.h"
#import "DetailsViewController.h"
#import "DashboardSearchController.h"

static NSString * const kDetailsSegue = @"DetailsSegue";

@interface DashboardViewController () <DashboardTableControllerDelegate, DashboardSearchControllerDelegate>

@property (nonatomic, weak) IBOutlet DashboardTableController * tableController;
@property (nonatomic, weak) IBOutlet DashboardSearchController * searchController;

@end

@implementation DashboardViewController {
    EntryParams *selectedParams;
}

@synthesize tableController;
@synthesize searchController;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [searchController.searchBar becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)getEntriesForSearch:(NSString *)search
{
    tableController.entries = nil;
    
    [GithubRequestRequestManager getEntriesForQuery:search done:^(NSArray <EntryParams *> *entries, NSError *error) {
        
        if(error) {
            // TODO: Catch the error (ie. show an alert message, send a new query, etc.)
        }
        else {
            tableController.entries = entries;
        }
    }];
}

#pragma mark - DashboardTableControllerDelegate

- (void)dashboardTableControllerDidSelectEntryParams:(EntryParams *)params
{
    selectedParams = params;
    
    if(selectedParams != nil) {
        [self performSegueWithIdentifier:kDetailsSegue sender:self];
    }
}

#pragma mark - DashboardSearchControllerDelegate

- (void)dashboardSearchControllerDidType:(NSString *)search
{
    [self getEntriesForSearch:search];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:kDetailsSegue]) {
        DetailsViewController *vc = [segue destinationViewController];
        vc.params = selectedParams;
    }
}

@end
