//
//  ViewController.m
//  Key-Value-Coding & Key-Value-Observer
//
//  Created by Shelly Pritchard on 26/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import "ViewController.h"
#import "Children.h"

@interface ViewController ()

@property (nonatomic, strong) Children *children1;
@property (nonatomic, strong) Children *children2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self method1];
    [self method2];


}


- (void)method1 {
    self.children1 = [[Children alloc] init];
    [self.children1 setValue:@"John" forKey:@"name"];
    [self.children1 setValue:[NSNumber numberWithInteger:20] forKey:@"age"];
    
    
    //Children
    NSString *name = [self.children1 valueForKey:@"name"];
    NSInteger age = [[self.children1 valueForKey:@"age"] integerValue];
    NSLog(@"Children1 : %@, %ld",name,(long)age);

}

- (void)method2 {
    self.children2 = [[Children alloc] init];
    self.children2.child = [[Children alloc] init];
    [self.children2 setValue:@"John" forKey:@"child.namew"];
    [self.children2 setValue:[NSNumber numberWithInteger:20] forKey:@"child.age"];
    
    //Child
    NSString *childName = [self.children2.child valueForKey:@"child.name"];
    NSInteger childAge = [[self.children2.child valueForKey:@"child.age"] integerValue];
    NSLog(@"Child : %@, %ld",childName,(long)childAge);

}

- (void)method3 {
    self.children1 = [[Children alloc] init];
    [self.children1 setValue:@"John" forKey:@"name"];
    [self.children1 setValue:[NSNumber numberWithInteger:20] forKey:@"age"];
    
    NSString *name = [self.children1.child valueForKey:@"name"];
    NSInteger age = [[self.children1.child valueForKey:@"age"] integerValue];
    
    NSLog(@"child : %@, %ld",name,(long)age);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
