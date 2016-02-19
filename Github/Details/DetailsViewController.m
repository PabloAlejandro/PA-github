//
//  DetailsViewController.m
//  Github
//
//  Created by Pau on 16/02/2016.
//

#import "DetailsViewController.h"
#import "GithubRequestRequestManager.h"

@interface DetailsViewController ()

@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel *issuesLabel;
@property (nonatomic, weak) IBOutlet UILabel *languageLabel;
@property (nonatomic, weak) IBOutlet UILabel *contributorsLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSAssert(self.params != nil, @"params can't be nil");
    
    [self setup];
    
    [self getContributors];
    
    [self getIssues];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationItem setTitle:self.params.name];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)setup
{
    // This is just a quick demo of how to set some labels text
    self.descriptionLabel.text = self.params.description;
    self.issuesLabel.text = nil;
    self.languageLabel.text = self.params.language;
    self.contributorsLabel.text = nil;
}

- (void)getContributors
{
    [GithubRequestRequestManager getContributorsFor:self.params.owner repo:self.params.name done:^(NSArray <NSString *> *contributors, NSError *error) {
        
        NSMutableString *str = [NSMutableString new];
        
        for(int i = 0; i < 3; i++) {
            [str appendFormat:@"%@\n", contributors[i]];
        }
        self.contributorsLabel.text = str;
    }];
}

- (void)getIssues
{
    [GithubRequestRequestManager getIssuesFor:self.params.owner repo:self.params.name done:^(NSArray <NSString *> *issues, NSError *error) {
        
        NSMutableString *str = [NSMutableString new];
        
        for(int i = 0; i < 3; i++) {
            [str appendFormat:@"%@\n", issues[i]];
        }
        self.issuesLabel.text = str;
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
