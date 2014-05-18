//
//  MLKShipmentTableViewController.m
//  MeeLink
//
//  Created by huanwen cao on 5/13/14.
//  Copyright (c) 2014 MeeLink. All rights reserved.
//

#import "MLKConversationTableViewController.h"

@interface MLKConversationTableViewController ()

@property (nonatomic,strong) NSArray* conversations;

@end

@implementation MLKConversationTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray* sunny= [NSArray arrayWithObjects:@"iPhone",@"iPad",nil];
    NSArray* huanwen= [NSArray arrayWithObjects:@"iMac",@"MacMini",nil];
    NSArray* mashall= [NSArray arrayWithObjects:@"Galaxy",@"ThinkPad",nil];
    NSDictionary* dic1= [NSDictionary dictionaryWithObjectsAndKeys:sunny,@"item",@"sunny",@"name", nil];
    NSDictionary* dic2= [NSDictionary dictionaryWithObjectsAndKeys:huanwen,@"item",@"huanwen",@"name", nil];
    NSDictionary* dic3= [NSDictionary dictionaryWithObjectsAndKeys:mashall,@"item",@"mashall",@"name", nil];
    self.conversations= [NSArray arrayWithObjects:dic1,dic2,dic3, nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.conversations count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary* dic = [self.conversations objectAtIndex:section];
    NSArray* array= dic[@"item"];
    return [array count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary* dic= [self.conversations objectAtIndex:section];
    return dic[@"name"];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"conversation"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"conversation"];
    }
    NSDictionary* dict = [self.conversations objectAtIndex:indexPath.section];
    NSArray* array = dict[@"item"];
    cell.textLabel.text=array[indexPath.row];
    
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"continueChat" sender:self];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
