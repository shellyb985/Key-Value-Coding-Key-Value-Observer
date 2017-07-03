//
//  Children.h
//  Key-Value-Coding & Key-Value-Observer
//
//  Created by Shelly Pritchard on 26/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Children : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,strong) Children *child;

@end
