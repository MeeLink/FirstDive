//
//  MLKProfilesViewController.m
//  MeeLink
//
//  Created by huanwen cao on 5/13/14.
//  Copyright (c) 2014 MeeLink. All rights reserved.
//

#import "MLKProfilesViewController.h"

@interface MLKProfilesViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) IBOutlet UISegmentedControl* segmentControl;
@property (nonatomic,strong) IBOutlet UITableView* tableView;

@property (nonatomic,strong) NSArray* addresses;
@property (nonatomic,strong) IBOutlet UILabel* nameLabel;
@property (nonatomic,strong) IBOutlet UIBarButtonItem* item;
@end

@implementation MLKProfilesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.addresses= [NSArray arrayWithObjects:@"101 Santa Clara ave,Santa Clara", nil];
    if (self.contactsInfo!=nil) {
        self.nameLabel.text=self.contactsInfo;
        [self.item setImage:[UIImage imageNamed:@"startChat"]];
    }
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)onBarItemClicked:(id)sender
{
    if (self.contactsInfo!=nil) {
        [self performSegueWithIdentifier:@"startChat" sender:self];
    }else{
       [self performSegueWithIdentifier:@"settings" sender:self]; 
    }
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (self.segmentControl.selectedSegmentIndex) {
        case 0:
        case 1:
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MLKMomentTableViewCell"];
            if (cell==nil) {
                cell= [[NSBundle mainBundle] loadNibNamed:@"MLKMomentTableViewCell" owner:nil options:nil][0];
            }
            // Configure the cell...
            
            return cell;

        }
            
        default:
        {
            if (indexPath.row< [self.addresses count]) {
                UITableViewCell* cell= [tableView dequeueReusableCellWithIdentifier:@"addresses"];
                if (cell==nil) {
                    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"addresses"];
                    
                }
                cell.detailTextLabel.text=[self.addresses objectAtIndex:indexPath.row];
                cell.textLabel.text= @"Home";
                return cell;
            }else{
                UITableViewCell* cell= [tableView dequeueReusableCellWithIdentifier:@"addAddress"];
                if (cell==nil) {
                    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addAddress"];
                    
                }
                cell.textLabel.text= @"AddAddress";
                return cell;

            }
        }
     break;
    }
    return nil;
}


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (self.segmentControl.selectedSegmentIndex) {
        case 0:
        case 1:
            return 120;
        default:
            if (indexPath.row< [self.addresses count]) {
                return 45;
            }else{
                return 30;
            }
    }
}

-(IBAction)onSegmentChanged:(id)sender
{
    [self.tableView reloadData];
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (self.segmentControl.selectedSegmentIndex) {
        case 0:
            return 1;//faked Data
        case 1:
            return 2;
        default:
            return [self.addresses count]+1;
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
