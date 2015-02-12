//
//  TodoList.h
//  ToDo
//
//  Created by Andrew Hautau on 2/5/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TodoListItem.h"

@interface TodoList : NSObject

@property (readwrite, nonatomic) BOOL canAddDuplicateItems;

-(void)addItem:(TodoListItem*)item;    // insert item if OK
-(BOOL)canAddItem:(TodoListItem*)item; // check if OK to insert

-(void)addItemWithTitle:(NSString*)title; // create and insert item if OK
-(BOOL)canAddItemWithTitle:(NSString *)title; // check if OK to insert
-(BOOL)hasItemWithTitle:(NSString*)title; // check if any item contained already has same title
-(void)removeItemWithTitle:(NSString*) title;

-(NSArray*)itemTitles;  // an array of all item titles (NSString*)
-(NSArray*)allItems;    // an array of all items
-(NSUInteger)itemCount; // number of items contained in list

+(instancetype)morningList;
+(instancetype)eveningList;

@end
