//
//  ProductVC.m
//  NavCtrl
//
//  Created by Jesse Sahli on 2/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "ProductVC.h"
#import "WebViewController.h"

@interface ProductVC ()

@end

@implementation ProductVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    // Do any additional setup after loading the view from its nib.
}


- (void)toggleEditMode {
    if (self.tableView.isEditing) {
        [self.tableView setEditing:NO animated:YES];
        self.navigationItem.rightBarButtonItem.title = @"Edit";
    }
    else {
        [self.tableView setEditing:YES animated:YES];
        self.navigationItem.rightBarButtonItem.title = @"Done";
    }
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSString *productName = [self.products objectAtIndex:[indexPath row]];
    
    if ([productName isEqualToString:@"iPad"]) {
        cell.imageView.image = [UIImage imageNamed:@"Apple"];
    }
    else if ([productName isEqualToString:@"iPod Touch"]) {
        cell.imageView.image = [UIImage imageNamed:@"Apple"];
    }
    else if ([productName isEqualToString:@"iPhone"]) {
        cell.imageView.image = [UIImage imageNamed:@"Apple"];
    }
    else if ([productName isEqualToString:@"Galaxy S4"]) {
        cell.imageView.image = [UIImage imageNamed:@"Samsung"];
    }
    else if ([productName isEqualToString:@"Galaxy Note"]) {
        cell.imageView.image = [UIImage imageNamed:@"Samsung"];
    }
    else if ([productName isEqualToString:@"Galaxy Tab"]) {
        cell.imageView.image = [UIImage imageNamed:@"Samsung"];
    }
    else if ([productName isEqualToString:@"HTCU11"]) {
        cell.imageView.image = [UIImage imageNamed:@"HTC"];
    }
    else if ([productName isEqualToString:@"HTC10"]) {
        cell.imageView.image = [UIImage imageNamed:@"HTC"];
    }
    else if ([productName isEqualToString:@"HTC Bolt"]) {
        cell.imageView.image = [UIImage imageNamed:@"HTC"];
    }
    else if ([productName isEqualToString:@"Razor"]) {
        cell.imageView.image = [UIImage imageNamed:@"Motorola"];
    }
    else if ([productName isEqualToString:@"Moto Z"]) {
        cell.imageView.image = [UIImage imageNamed:@"Motorola"];
    }
    else if ([productName isEqualToString:@"Hasselblad"]) {
        cell.imageView.image = [UIImage imageNamed:@"Motorola"];
    }
    // Configure the cell...
    cell.textLabel.text = [self.products objectAtIndex:[indexPath row]];
    
    return cell;
}


 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }

 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
     [self.products removeObjectAtIndex:indexPath.row];
     [self.tableView reloadData];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }

 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
     NSString *productToMove = self.products[fromIndexPath.row];

     [self.products removeObjectAtIndex:fromIndexPath.row];
     [self.products insertObject:productToMove atIndex:toIndexPath.row];
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
 // Navigation logic may go here, for example:
     
 // Create the next view controller.
    
  WebViewController *detailViewController = [[WebViewController alloc] init];
     if([[self.products objectAtIndex:indexPath.row] isEqualToString:@"iPad"]){
         detailViewController.url = [[NSURL alloc] initWithString:@"https://www.apple.com/ipad/"];
     }
     else if ([[self.products objectAtIndex:indexPath.row] isEqualToString:@"iPod Touch"]){
         detailViewController.url = [[NSURL alloc] initWithString:@"https://www.apple.com/ipod-touch/"];
     }
     else if ([[self.products objectAtIndex:indexPath.row] isEqualToString:@"iPhone"]){
         detailViewController.url = [[NSURL alloc] initWithString:@"https://www.apple.com/iphone/"];
     }
     else if ([[self.products objectAtIndex:indexPath.row] isEqualToString:@"Galaxy S4"]){
         detailViewController.url = [[NSURL alloc] initWithString:@"http://www.samsung.com/us/explore/galaxy-s8/?cid=ppc-Generic"];
     }
     else if ([[self.products objectAtIndex:indexPath.row] isEqualToString:@"Galaxy Note"]){
         detailViewController.url = [[NSURL alloc] initWithString:@"http://www.samsung.com/us/mobile/phones/galaxy-note/s/_/n-10+11+hv1rp+zq1xb/"];
     }
     else if ([[self.products objectAtIndex:indexPath.row] isEqualToString:@"Galaxy Tab"]){
         detailViewController.url = [[NSURL alloc] initWithString:@"http://www.samsung.com/us/explore/tab-s3-features-and-specs/?CID=PPC-"];
     }
     else if ([[self.products objectAtIndex:indexPath.row] isEqualToString:@"HTCU11"]){
         detailViewController.url = [[NSURL alloc] initWithString:@"http://www.htc.com/us/smartphones/htc-u11/?network=g&campaignid=809895245&adgroupid=45219473271&creative=195337241928&keyword=htcu11&gclid=Cj0KEQjw9r7JBRCj37PlltTskaMBEiQAKTzTfIBjj5rvrZoFGSEZknej0NXoKPmCejpiv88nB2bhssQaAvLX8P8HAQ"];
     }
     else if ([[self.products objectAtIndex:indexPath.row] isEqualToString:@"HTC10"]){
         detailViewController.url = [[NSURL alloc] initWithString:@"http://www.htc.com/us/smartphones/htc-10/"];
     }
     else if ([[self.products objectAtIndex:indexPath.row] isEqualToString:@"HTC Bolt"]){
         detailViewController.url = [[NSURL alloc] initWithString:@"https://www.htc.com/us/smartphones/htc-bolt/buy/"];
     }
     else if ([[self.products objectAtIndex:indexPath.row] isEqualToString:@"Razor"]){
         detailViewController.url = [[NSURL alloc] initWithString:@"https://en.wikipedia.org/wiki/Motorola_Razr"];
     }
     else if ([[self.products objectAtIndex:indexPath.row] isEqualToString:@"Moto Z"]){
         detailViewController.url = [[NSURL alloc] initWithString:@"https://www.motorola.com/us/products/moto-z-family?gclid=Cj0KEQjw9r7JBRCj37PlltTskaMBEiQAKTzTfFGMmIJfGBuqGyLeIqdsFLdgwtRIcfb34wQ355tv1HQaAgCb8P8HAQ&dclid=CM_t2c6vndQCFZMNNwodc3oCXw"];
     }
     else if ([[self.products objectAtIndex:indexPath.row] isEqualToString:@"Hasselblad"]){
         detailViewController.url = [[NSURL alloc] initWithString:@"https://www.motorola.com/us/products/moto-mods/hasselblad-true-zoom"];
     }
     //detailViewController.url =
 
 // Pass the selected object to the new view controller.
 
 // Push the view controller.
 [self.navigationController pushViewController:detailViewController animated:YES];
 }
 
 


- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
