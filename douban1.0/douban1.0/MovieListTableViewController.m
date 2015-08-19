//
//  MovieListTableViewController.m
//  homeWork-网络请求
//
//  Created by lanou3g on 15/7/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MovieListTableViewController.h"
#import "MovieListTableViewCell.h"
#import "URL.h"
#import "Movie.h"
#import "MovieDetaiViewController.h"
@interface MovieListTableViewController ()

@property(nonatomic,retain)NSMutableArray * movieArray;//接收电影对象
@end

@implementation MovieListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav@2x.png"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.title=@"电影";
    
    
    //注册自定义cell
    UINib * nib=[UINib nibWithNibName:@"MovieListTableViewCell" bundle:nil];
    
    [self.tableView  registerNib:nib forCellReuseIdentifier:@"mycell1"];
    

    self.navigationItem.title=@"电影";
    
    //设置导航栏背景图片
    self.navigationController.navigationBar.backIndicatorImage=[UIImage imageNamed:@"bg_nav@2x.png"];
    //网络请求 数据解析
    [self NSLRULRequest];

}

-(void)NSLRULRequest
{
    //创建网址对象
    NSURL * url=[NSURL URLWithString:movieList];
    
    //创建请求方式对象
    NSURLRequest * request=[NSURLRequest requestWithURL:url];
    
    //同步发送请求
//    NSData * data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    [NSURLConnection  sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSMutableDictionary * dic=[NSJSONSerialization JSONObjectWithData:data options:1 error:nil];
        //取出key值为result的数组
        NSArray * array=[dic objectForKeyedSubscript:@"result"];
        //开辟空间
        self.movieArray=[NSMutableArray array];
        
        //遍历数组
        for (NSDictionary * dic1 in array) {
            //创建电影对象
            Movie *movie=[[Movie alloc]init];
            
            [movie setValuesForKeysWithDictionary:dic1];
            
            [_movieArray addObject:movie];
        }
        
        [self.tableView reloadData];
        
    }];
    }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _movieArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   MovieListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell1" forIndexPath:indexPath];
    //创建电影对象
    Movie * movie=_movieArray[indexPath.row];
    cell.movieName.text=movie.movieName;
    if ( movie.picture==nil) {
        [movie laodimage];
        //注册观察者
        [movie addObserver:self forKeyPath:@"picture" options:NSKeyValueObservingOptionNew context:(__bridge void *)(indexPath)];
    }else{
        
        cell.pic_url.image=movie.picture;
    }
    return cell;
}

//实现观察者回调方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //获取新加的图片
    UIImage * image=[change objectForKey:@"new"];
    //获取注册观察者时,传过来的context
    NSIndexPath * indexPath=(__bridge NSIndexPath *)(context);
    //获取当前屏幕上正在显示的cell
    NSArray *showArray=[self.tableView indexPathsForVisibleRows];
    
    //判断当前movie对象是否对应当前showArray
    if ([showArray containsObject:indexPath]) {
        
        MovieListTableViewCell * cell=(MovieListTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
        cell.pic_url.image=image;
    }
    //移除观察者
    [object removeObserver:self forKeyPath:@"picture" context:(__bridge void *)(indexPath)];
}
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 150;
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


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    MovieDetaiViewController * MDVC=[[MovieDetaiViewController alloc]init];
    //创建电影对象
    Movie * movie=_movieArray[indexPath.row];
    
   //网络请求
     MDVC.movieId=movie.movieId;
     
    
    
    [self.navigationController pushViewController:MDVC animated:YES];
    
  
    
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
