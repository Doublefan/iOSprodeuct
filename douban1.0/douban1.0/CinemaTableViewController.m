//
//  CinemaTableViewController.m
//  homeWork-网络请求
//
//  Created by lanou3g on 15/7/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CinemaTableViewController.h"
#import "URL.h"
#import "Cinema.h"
#import "CinemaTableViewCell.h"
#import "CinemaDetailController.h"
@interface CinemaTableViewController ()
@property(nonatomic,retain)NSMutableArray * cinemaArray;
@end

@implementation CinemaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav@2x.png"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.title=@"影院";
    //注册cell
    UINib * nib=[UINib nibWithNibName:@"CinemaTableViewCell" bundle:nil];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:@"mycell2"];
    

    
    //网络请求 数据解析
    [self NSRULRequest];
    
}

//网络请求 数据解析
-(void)NSRULRequest{
    
    //创建网址对象
    NSURL * url=[NSURL URLWithString:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/cinemalist.php"];
    
    //创建请求方式对象
    NSURLRequest * request=[NSURLRequest requestWithURL:url];
    
    // 同步发送请求
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSMutableDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:1 error:nil];
    
    NSMutableDictionary * dic1=[dic objectForKey:@"result"];
    NSArray *array=[dic1 objectForKey:@"data"];
    
    self.cinemaArray=[NSMutableArray array];
    //遍历数组
    for (NSDictionary * dic2 in array) {
        //创建影院对象
        Cinema * cinema1=[Cinema new];
        
        //使用kvc赋值
        [cinema1 setValuesForKeysWithDictionary:dic2];
        
        //将电影对象添加到数组中
        [_cinemaArray addObject:cinema1];
        
        
        
    }
    

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return _cinemaArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CinemaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell2" forIndexPath:indexPath];
    
    //创建影院对象
    Cinema * cinema2=_cinemaArray[indexPath.section];
   
    cell.cinema1=cinema2;
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return 140;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CinemaDetailController * cinemaVC = [[CinemaDetailController alloc]init];
    Cinema * cinemaa = _cinemaArray[indexPath.section];
    cinemaVC.cinemaId = cinemaa.id;
    [self.navigationController pushViewController:cinemaVC animated:YES];
    
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
