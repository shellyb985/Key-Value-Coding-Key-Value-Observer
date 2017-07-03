//
//  Children.m
//  Key-Value-Coding & Key-Value-Observer
//
//  Created by Shelly Pritchard on 26/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import "Children.h"

@implementation Children

- (id)init {
    self = [super init];
    if (self) {
        self.name = @"";
        self.age = 0;
    }
    return self;
}

@end


@implementation Parent

- (id)init {
    self = [super init];
    if (self) {
        self.name = @"";
        self.age = 0;
        self.child = [[Children alloc] init];
    }
    return self;
}

@end
