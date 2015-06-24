//
//  ViewController.m
//  iWeather
//
//  Created by mac on 6/8/15.
//  Copyright (c) 2015 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
}
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *tempType;

@end

@implementation ViewController
{
    NSArray *quotes;
    NSArray *locations;
    NSArray *photoFiles;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    quotes = @[@"Một con ngựa đau cả tàu bỏ cỏ", @"Có công mài sắt có ngày nên kim",
               @"Chớ thấy sóng cả mà ngã tay chèo", @"Không có gì quý hơn độc lập hạnh phúc", @"Đi một ngày đàng học một sàng không"];
    
    locations = @[@"Hai Ba Trung, Ha Noi", @"Sydney, Australia", @"New York, USA"];
    
    photoFiles = @[@"rain", @"sunny", @"thunder", @"windy"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)updateWeather:(id)sender {
    int quoteIndex = arc4random_uniform(quotes.count);
    self.quote.text = quotes[quoteIndex];
    
    int locationIndex = arc4random_uniform(locations.count);
    self.location.text = locations[locationIndex];
    
    int photoIndex = arc4random_uniform(photoFiles.count);
    self.weatherIcon.image = [UIImage imageNamed:photoFiles[photoIndex]];
    
    NSString *string = [NSString stringWithFormat:@"%2.1f", [self getTemperature]];
    [self.temperature setTitle:string forState:UIControlStateNormal];
    
}

- (float) getTemperature {
    return 14.0 + arc4random_uniform(18) + (float)arc4random() / (float)INT32_MAX;
}


- (IBAction)changeTemperature:(id)sender {
    if ([[self.tempType text]  isEqual: @"C"]) {
        self.tempType.text = @"F";
    } else {
        self.tempType.text = @"C";
    }
    NSLog(@"%@", [self.tempType text]);
}

@end
