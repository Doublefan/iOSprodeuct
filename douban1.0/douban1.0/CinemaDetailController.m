//
//  CinemaDetailController.m
//  豆瓣_电影
//
//  Created by lanou3g on 15/7/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CinemaDetailController.h"
#import "CinemaDetail.h"
#import "CinemaDetailCell.h"

@interface CinemaDetailController ()

@end

@implementation CinemaDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   //注册定义cell
    UINib * nib = [UINib nibWithNibName:@"CinemaDetailCell" bundle:nil];
    NSLog(@"%@",nib);
    [self.tableView registerNib:nib forCellReuseIdentifier:@"cinemacell"];
    //解析数据
    [self dataPaser];
 
}
#pragma mark--------------根据从影院列表传过来的影院ID请求数据
-(void)dataPaser
{
    //1.创建url对象
    NSString * str = [NSString stringWithFormat:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/searchcinema.php?cinemaId=%@",_cinemaId];
    //NSLog(@"%@",_cinemaId);
    NSURL * url = [NSURL URLWithString:str];
    //2.创建request请求对象
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    //3.connection连接对象
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //解析数据
        //NSDictionary * dic = [data objectFromJSONData];
        NSMutableDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:1 error:nil];
        NSDictionary * smallDic = [dic objectForKey:@"result"];
       
        NSMutableArray * array = [smallDic objectForKey:@"lists"];
        self.cinemaArray = [NSMutableArray array];
    
        for (NSDictionary * dic in array) {
            CinemaDetail * cinema = [[CinemaDetail alloc]init];
            [cinema setValuesForKeysWithDictionary:dic];

            [_cinemaArray addObject:cinema];
            //NSLog(@"%@",_cinemaArray);
            
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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return _cinemaArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    CinemaDetail * cinema = _cinemaArray[section];
    NSArray * broadcastArray = cinema.broadcast;
    return broadcastArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CinemaDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cinemacell" forIndexPath:indexPath];
    CinemaDetail * cinema = _cinemaArray[indexPath.section];
    NSArray * broadcastArray = cinema.broadcast;
    NSDictionary * smallDic = broadcastArray[indexPath.row];
    
    cell.movieName.text = cinema.movieName;
    cell.hall.text = [smallDic objectForKey:@"hall"];
    cell.language.text = [smallDic objectForKey:@"language"];
    cell.type.text = [smallDic objectForKey:@"type"];
    cell.time.text = [smallDic objectForKey:@"time"];
    cell.price.text = [smallDic objectForKey:@"price"];
    
    if (cinema.picture ==nil) {
        [cinema loadImage];
    }else{
        cell.imgView.image = cinema.picture;
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    CinemaDetail * cinema = _cinemaArray[section];
    return cinema.movieName;
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
