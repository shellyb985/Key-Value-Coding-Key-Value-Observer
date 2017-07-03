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

@property (nonatomic, strong) Parent *parent;
@property (nonatomic, strong) Parent *parentWithChild;
@property (nonatomic, strong) Parent *parentWithChild2;
@property (nonatomic, strong) Parent *parentWithChild3;
@property (nonatomic, strong) Parent *parentWithChild4;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //KVC
    [self valueForKey];
    [self valueForKeyForSubClass];
    [self valueForKeyPath];
    [self dictionaryWithValuesForKeys];
    
    //KVO
    [self keyValueOberver];


}


- (void)valueForKey {
    self.parent = [[Parent alloc] init];
    [self.parent setValue:@"John" forKey:@"name"];
    [self.parent setValue:[NSNumber numberWithInteger:20] forKey:@"age"];
    
    //Children
    NSString *name = [self.parent valueForKey:@"name"];
    NSInteger age = [[self.parent valueForKey:@"age"] integerValue];
    NSLog(@"Parent : %@, %ld",name,(long)age);
}

- (void)valueForKeyForSubClass {
    self.parentWithChild = [[Parent alloc] init];
    self.parentWithChild.child = [[Children alloc] init];
    [self.parentWithChild.child setValue:@"Peter" forKey:@"name"];
    [self.parentWithChild.child setValue:[NSNumber numberWithInteger:23] forKey:@"age"];
    
    NSString *childName = [self.parentWithChild.child valueForKey:@"name"];
    NSInteger childAge = [[self.parentWithChild.child valueForKey:@"age"] integerValue];
    NSLog(@"Child : %@, %ld",childName,(long)childAge);\
}

- (void)valueForKeyPath {
    self.parentWithChild2 = [[Parent alloc] init];
    [self.parentWithChild2 setValue:@"Joe" forKeyPath:@"child.name"];
    [self.parentWithChild2 setValue:[NSNumber numberWithInteger:15] forKeyPath:@"child.age"];
    
    NSString *name = [self.parentWithChild2 valueForKeyPath:@"child.name"];
    NSInteger age = [[self.parentWithChild2 valueForKeyPath:@"child.age"] integerValue];
    
    NSLog(@"child : %@, %ld",name,(long)age);
}

- (void)dictionaryWithValuesForKeys {

}

- (void)keyValueOberver {
    self.parentWithChild4 = [[Parent alloc] init];
    
    [self.parentWithChild4.child addObserver:self.parentWithChild4 forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:NULL];
    
    [self.parentWithChild4.child setValue:@"Rakesh" forKey:@"name"];
    
    [self.parentWithChild4.child removeObserver:self.parentWithChild4 forKeyPath:@"name"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
