//
//  CompanyVC.m
//  NavCtrl
//
//  Created by Jesse Sahli on 2/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "CompanyVC.h"

@interface CompanyVC ()

@property NSMutableArray* appleProds;
@property NSMutableArray* samsungProds;
@property NSMutableArray* htcProds;
@property NSMutableArray* motorolaProds;


@end

@implementation CompanyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(toggleEditMode)];
    self.navigationItem.rightBarButtonItem = editButton;
    
    self.appleProds = [[NSMutableArray alloc] initWithArray:@[@"iPad", @"iPod Touch",@"iPhone"]];
    self.samsungProds = [[NSMutableArray alloc] initWithArray:@[@"Galaxy S4", @"Galaxy Note", @"Galaxy Tab"]];
    self.htcProds = [[NSMutableArray alloc] initWithArray:@[@"HTCU11", @"HTC10",@"HTC Bolt"]];
    self.motorolaProds = [[NSMutableArray alloc] initWithArray:@[@"Razor", @"Moto Z",@"Hasselblad"]];

    
    self.companyList = [[NSMutableArray alloc] initWithArray:@[@"Apple mobile devices",@"Samsung mobile devices", @"HTC mobile devices", @"Motorola mobile devices"]];
    
    self.title = @"Mobile device makers";
    // Do any additional setup after loading the view from its nib.
}

- (void)toggleEditMode {
    
    if (self.tableView.editing) {
        [self.tableView setEditing:NO animated:YES];
        self.navigationItem.rightBarButtonItem.title = @"Edit";
    } else {
        [self.tableView setEditing:YES animated:NO];
        self.navigationItem.rightBarButtonItem.title = @"Done";
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.companyList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *companyName = [self.companyList objectAtIndex:[indexPath row]];
    
    if ([companyName isEqualToString:@"Apple mobile devices"]) {
        cell.imageView.image = [UIImage imageNamed:@"Apple"];
    }
    else if ([companyName isEqualToString:@"Samsung mobile devices"]) {
        cell.imageView.image = [UIImage imageNamed:@"Samsung"];
    }
    else if ([companyName isEqualToString:@"HTC mobile devices"]) {
            cell.imageView.image = [UIImage imageNamed:@"HTC"];
    }
    else if ([companyName isEqualToString:@"Motorola mobile devices"]) {
        cell.imageView.image = [UIImage imageNamed:@"Motorola"];
    }
    // Configure the cell...
    
    cell.textLabel.text = [self.companyList objectAtIndex:[indexPath row]];
    
    return cell;
}



 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.companyList removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
}
/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */


 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
     NSString *productToMove = self.companyList[fromIndexPath.row];
     
     [self.companyList removeObjectAtIndex:fromIndexPath.row];
     [self.companyList insertObject:productToMove atIndex:toIndexPath.row];
     [self.tableView reloadData];
 }
 


 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 


#pragma mark - Table view delegate

    
    
// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *selectedCompany = [self.companyList objectAtIndex:indexPath.row];

    self.productViewController = [[ProductVC alloc]init];
    if ([selectedCompany isEqualToString:@"Apple mobile devices"]){
        self.productViewController.title = @"Apple mobile devices";
        self.productViewController.products = self.appleProds;
        
    } else if ([selectedCompany isEqualToString:@"Samsung mobile devices"]){
        self.productViewController.title = @"Samsung mobile devices";
        self.productViewController.products = self.samsungProds;
        
    } else if ([selectedCompany isEqualToString:@"HTC mobile devices"]){
        self.productViewController.title = @"HTC mobile devices";
        self.productViewController.products = self.htcProds;
        
    } else if ([selectedCompany isEqualToString:@"Motorola mobile devices"]){
        self.productViewController.title = @"Motorola mobile devices";
        self.productViewController.products = self.motorolaProds;
    }
    
    [self.navigationController
     pushViewController:self.productViewController
     animated:YES];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
