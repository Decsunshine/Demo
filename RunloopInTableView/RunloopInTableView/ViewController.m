//
//  ViewController.m
//  RunloopInTableView
//
//  Created by lu hongliang on 2019/3/24.
//  Copyright © 2019 lu hongliang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) double lastUpdateTimestamp;
@property (nonatomic, assign) int historyCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                                  style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
//    [self addRunLoopObserver];
    
    [self setupDispalyLink];
}

- (void)setupDispalyLink
{
    self.lastUpdateTimestamp = 0;
    self.historyCount = 0;
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateLabelValue)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:UITrackingRunLoopMode];
    self.displayLink = displayLink;
}

- (void)updateLabelValue
{
    if (self.lastUpdateTimestamp <= 0) {
        self.lastUpdateTimestamp = self.displayLink.timestamp;
    }
    
    self.historyCount += 1;
    double interval = self.displayLink.timestamp - self.lastUpdateTimestamp;
    if (interval >= 1) {
        self.lastUpdateTimestamp = 0;
        double fps = self.historyCount / interval;
        NSLog(@"FPS %f", fps);
        self.historyCount = 0;
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    [cell.textLabel setText:[NSString stringWithFormat:@"这是第%li个cell", (long)indexPath.row]];
    cell.textLabel.layer.cornerRadius = 10;
    cell.textLabel.layer.shadowOffset = CGSizeMake(10, 10);
    cell.textLabel.layer.shadowOpacity = 1;
    return cell;
}

// 添加一个监听者
- (void)addRunLoopObserver {
    // 1. 创建监听者
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"进入RunLoop");
                break;
            case kCFRunLoopBeforeTimers:
                NSLog(@"即将处理Timer事件");
                break;
            case kCFRunLoopBeforeSources:
                NSLog(@"即将处理Source事件");
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"即将休眠");
                break;
            case kCFRunLoopAfterWaiting:
                NSLog(@"被唤醒");
                break;
            case kCFRunLoopExit:
                NSLog(@"退出RunLoop");
                break;
            default:
                break;
        }
    });
    
    // 2. 添加监听者
    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);
}

@end
