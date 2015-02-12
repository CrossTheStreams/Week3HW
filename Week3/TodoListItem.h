//
//  TodoListItem.h
//  ToDo
//
//  Created by Andrew Hautau on 2/5/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoListItem : NSObject

@property(strong, nonatomic) NSString *title;

-(instancetype)initWithTitle:(NSString*)title;

@end
