//
//  ActivityTableViewController.m
//  douban1.0
//
//  Created by lanou3g on 15/7/24.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ActivityTableViewController.h"

@interface ActivityTableViewController ()
@end

@implementation ActivityTableViewController
- (void)viewDidLoad {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav@2x.png"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.title=@"活动";
    [super viewDidLoad];
    [self.tableView reloadData];
    UINib*nib=[UINib nibWithNibName:@"ActivityTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"activitycell"];
    NSURL*url=[NSURL URLWithString:ACTIVITY];
    NSURLRequest*request=[NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];   
    self.allArray=[NSMutableArray array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_allArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"activitycell" forIndexPath:indexPath];
    Activity*actitity=_allArray[indexPath.row];
    cell.activity=actitity;
    if (actitity.picture==nil) {
        [actitity loadImage];
        [actitity addObserver:self forKeyPath:@"picture" options:NSKeyValueObservingOptionNew context:(__bridge void *)(indexPath)];
    }else{
    cell.image.image=actitity.picture;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 195;
}
//将要发送请求
-(NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response{
    return request;
}
//服务器已经响应
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    _alldata =[[NSMutableData alloc]init];
}
//正在接收
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_alldata appendData:data];
    NSMutableDictionary*dic=[NSJSONSerialization JSONObjectWithData:_alldata options:NSJSONReadingMutableContainers error:nil];
    NSMutableArray*array=[dic objectForKey:@"events"];
    //NSLog(@"%@",array);
    for (int i=0; i<[array count]; i++) {
        Activity*activi=[[Activity alloc]init];
        [activi setValuesForKeysWithDictionary:array[i]];
        //NSLog(@"%@",activi.owner);
        [_allArray addObject:activi];
    }
    [self.tableView reloadData];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    UIImage*image=[change objectForKey:@"new"];
    NSIndexPath*index=(__bridge NSIndexPath *)context;
    NSArray*array=[self.tableView indexPathsForSelectedRows];
    if ([array containsObject:index]) {
    ActivityTableViewCell*cell=(ActivityTableViewCell*)[self.tableView cellForRowAtIndexPath:index];
        cell.image.image=image;
    }
    [self.tableView reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationFade];
    [object removeObserver:self forKeyPath:@"picture" context:(__bridge void *)(index)];
}
//推出详情
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ActivityDetailsViewController*details=[[ActivityDetailsViewController alloc]init];
    Activity*activity=[[Activity alloc]init];
    activity=_allArray[indexPath.row];
    details.activity=activity;
    details.activity.collectItem=1;
    [self.navigationController pushViewController:details animated:YES];
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
