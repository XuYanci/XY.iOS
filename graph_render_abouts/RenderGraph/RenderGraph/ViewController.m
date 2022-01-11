//
//  ViewController.m
//  RenderGraph
//
//  Created by Yanci on 2019/5/11.
//  Copyright © 2019 Yanci. All rights reserved.
//

#import "ViewController.h"

@interface CustomerLayer : CALayer

@end
@implementation CustomerLayer
- (void)display {
    self.backgroundColor = [UIColor redColor].CGColor;
    self.contents = (id)[UIImage imageNamed:@"pattern"].CGImage;
    NSLog(@"Display");
}


@end

@interface CustomContainer : UIView

@end

@implementation CustomContainer
 
//- (void)drawRect:(CGRect)rect {
//
//}

+ (Class)layerClass {
    return [CustomerLayer class];
}

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

@end




@interface CustomerCornerCell : UITableViewCell
@property (nonatomic,strong) UIButton *cornerButton;
@property (nonatomic,strong) UILabel *subTitleLabel;
@property (nonatomic,strong) CustomContainer *containerView;

@property (nonatomic,strong) UIView *underCornerView;
@property (nonatomic,strong) UIView *throughCornerView;
@property (nonatomic,strong) UIView *intersetCornerView;


@end

@implementation CustomerCornerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self commonInit];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.containerView.frame = self.bounds;
}

- (void)commonInit {
    
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.containerView];
    self.containerView.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.cornerButton];
    self.cornerButton.frame = CGRectMake(12, 12, 50, 50);
    
    /// Set Content View Corner
    //    self.contentView.layer.cornerRadius = 25.0;
    //    self.contentView.layer.masksToBounds = YES;
    
    /// Set custom Button Corner
    self.cornerButton.layer.cornerRadius = 25.0;
    self.cornerButton.layer.masksToBounds = YES;
    
    /// Set Custom Button ImageView Corner
//    self.cornerButton.imageView.layer.cornerRadius = 25;
//    self.cornerButton.imageView.layer.masksToBounds = YES;
    
    
    /// Set Custom Buttom ImageView Border
    //    self.cornerButton.imageView.layer.borderWidth = 0.5;
    //    self.cornerButton.imageView.layer.borderColor = [UIColor grayColor].CGColor;
    
    /// Set Custom Buttom ImageView Shadow
    //    self.cornerButton.layer.shadowOffset = CGSizeMake(5, 5);
    //    self.cornerButton.layer.shadowOpacity = 0.8;
    //    self.cornerButton.layer.shadowColor = [UIColor blueColor].CGColor;
    
    
    [self.contentView addSubview:self.subTitleLabel];
    self.subTitleLabel.frame =  CGRectMake(75, 25, 30, 30);
    [self.subTitleLabel sizeToFit];
    
    /// Set Custom Label Shadow
    //    self.subTitleLabel.backgroundColor = [UIColor clearColor];
    //    self.subTitleLabel.layer.shadowOffset = CGSizeMake(0, 2);
    //    self.subTitleLabel.layer.shadowOpacity = 0.5;
    
    /// Set Custom Label Shadow More Efficient
    //    self.subTitleLabel.layer.shadowPath = CGPathCreateWithRect(imageRect, NULL);
    
    
    /// Clip Corner
    
    /// Precomposite alpha
    
    /// Precomposite opaque
    
    /// Set ShouldRasterize
//    self.cornerButton.layer.shouldRasterize = YES;
    
}
 

- (UIButton *)cornerButton {
    if (_cornerButton) {
        return _cornerButton;
    }
    _cornerButton = [[UIButton alloc]init];
    return _cornerButton;
}

- (UILabel *)subTitleLabel {
    if (_subTitleLabel) {
        return _subTitleLabel;
    }
    _subTitleLabel = [[UILabel alloc]init];
    _subTitleLabel.text = @"我是一个圆角";
    return _subTitleLabel;
}

- (CustomContainer *)containerView {
    if (_containerView) {
        return _containerView;
    }
    _containerView = [[CustomContainer alloc]init];
    return _containerView;
}

- (UIView *)underCornerView {
    if (_underCornerView) {
        return _underCornerView;
    }
    _underCornerView = [[UIView alloc]init];
    _underCornerView.backgroundColor = [UIColor blueColor];
    return _underCornerView;
}



- (UIView *)throughCornerView {
    if (_throughCornerView) {
        return _throughCornerView;
    }
    _throughCornerView = [[UIView alloc]init];
    _throughCornerView.backgroundColor = [UIColor orangeColor];
    return _throughCornerView;
}

- (UIView *)intersetCornerView {
    if (_intersetCornerView) {
        return _intersetCornerView;
    }
    _intersetCornerView = [[UIView alloc]init];
    _intersetCornerView.backgroundColor = [UIColor greenColor];
    return _intersetCornerView;
}

 
@end



@interface ViewController ()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation ViewController


- (NSString *)randomName
{
    NSArray *first = @[@"Alice", @"Bob", @"Bill", @"Charles", @"Dan", @"Dave", @"Ethan", @"Frank"];
    NSArray *last = @[@"Appleseed", @"Bandicoot", @"Caravan", @"Dabble", @"Ernest", @"Fortune"];
    NSUInteger index1 = (rand()/(double)INT_MAX) * [first count];
    NSUInteger index2 = (rand()/(double)INT_MAX) * [last count];
    return [NSString stringWithFormat:@"%@ %@", first[index1], last[index2]];
}

- (NSString *)randomAvatar
{
    /// PNG Small
    NSArray *images = @[@"batman", @"caLogo", @"pin", @"tach", @"pattern", @"arrow-down"];
    /// JPEG Big
    //  NSArray *images = @[@"1", @"2", @"3", @"4", @"5", @"6"];
    NSUInteger index = (rand()/(double)INT_MAX) * [images count];
    return images[index];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 10000; i++) {
        [array addObject:@{@"name": [self randomName], @"image": [self randomAvatar]}];
    }
    self.items = array;
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.tableView registerClass:[CustomerCornerCell class] forCellReuseIdentifier:NSStringFromClass([CustomerCornerCell class])];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomerCornerCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CustomerCornerCell class])
                                                                    forIndexPath:indexPath];
    NSDictionary *item = self.items[indexPath.row];
    
    /// Set Text
    cell.subTitleLabel.text = item[@"name"];
    [cell.subTitleLabel sizeToFit];
 
  
    /// UIImage ImageNamed
    [cell.cornerButton setImage:[UIImage imageNamed:item[@"image"]] forState:UIControlStateNormal];
    
    /// UIImage imageWithContentsOfFile
    //    NSString *filePath = [[NSBundle mainBundle] pathForResource:item[@"image"] ofType:@"jpeg"];
    //    [cell.customButton setImage:[UIImage imageWithContentsOfFile:filePath] forState:UIControlStateNormal];
    
//   [cell.containerView.layer setNeedsDisplay];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}


@end
