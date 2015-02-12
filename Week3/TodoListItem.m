//
//  TodoListItem.m
//  ToDo
//
//  Created by Andrew Hautau on 2/5/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import "TodoListItem.h"

@implementation TodoListItem


-(instancetype)initWithTitle:(NSString*)title {
    self = [super init];
    if (self) {
        [self setTitle:title];
    }
    return self;
}

@end
