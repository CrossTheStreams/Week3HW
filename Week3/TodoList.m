//
//  TodoList.m
//  ToDo
//
//  Created by Andrew Hautau on 2/5/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import "TodoList.h"

@interface TodoList()

@property (strong, nonatomic) NSMutableArray *todoArray;

@end

@implementation TodoList


-(id) init {
    self = [super init];
    if (self) {
      [self setTodoArray: [[NSMutableArray alloc] init]];
        self.canAddDuplicateItems = YES;
    }
    return self;
}

-(id) initWithTitles:(NSArray*) titles {
    self = [self init];
    if (self) {
        for (NSString *title in titles) {
            [self addItemWithTitle:title];
        }
    }
    return self;
}

-(void) addItem:(TodoListItem *)item {
    if ([self canAddItem:item]) {
        [[self todoArray] addObject:item];
    }
}

-(BOOL) canAddItem:(TodoListItem *)item {
    if (self.canAddDuplicateItems) {
        return YES;
    } else {
        if ([self hasItemWithTitle:item.title]) {
            return NO;
        } else {
            return YES;
        }
    }
}

-(BOOL) canAddItemWithTitle:(NSString *)title {
    if ([title isEqualToString:@""]) {
        return NO;
    } else {
        TodoListItem *item = [[TodoListItem alloc] initWithTitle: title];
        return [self canAddItem:item];
    }

}

-(void) addItemWithTitle:(NSString *)title {
    TodoListItem *item = [[TodoListItem alloc] initWithTitle:title];
    [self addItem:item];
}

-(BOOL)hasItemWithTitle:(NSString*)title {
    BOOL hasItem = NO;
    for (TodoListItem *item in self.todoArray) {
        NSString *itemTitle = item.title;
        if ([itemTitle isEqualToString:title]) {
            hasItem = YES;
        }
    }
    return hasItem;
}

-(void)removeItemWithTitle:(NSString*) title {
    NSUInteger index = [self.todoArray indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        TodoListItem *item = [self.todoArray objectAtIndex:idx];
        return [item.title isEqualToString:title];
    }];
    [self.todoArray removeObjectAtIndex:index];
}

-(NSArray*) allItems {
    return [NSArray arrayWithArray:self.todoArray];
}

-(NSArray*) itemTitles {
    NSMutableArray *titles = [NSMutableArray new];
    for (TodoListItem *item in self.todoArray) {
        [titles addObject:item.title];
    }
    return [NSArray arrayWithArray: titles];
}

-(NSUInteger) itemCount {
    return [self.todoArray count];
}

+(TodoList*) morningList {
    NSArray *titles = @[@"brush teeth", @"shower", @"breakfast"];
    TodoList *list = [[TodoList alloc] initWithTitles:titles];
    return list;
}

+(TodoList*) eveningList {
    NSArray *titles = @[@"dinner", @"shower", @"sleep"];
    TodoList *list = [[TodoList alloc] initWithTitles:titles];
    return list;
}

@end
