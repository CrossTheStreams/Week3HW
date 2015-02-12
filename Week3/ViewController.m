//
//  ViewController.m
//  ToDo
//
//  Created by Andrew Hautau on 2/5/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import "ViewController.h"
#import "TodoList.h"

@interface ViewController ()

@property (strong, nonatomic) TodoList *todoList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTodoList: [TodoList morningList]];
    [self.table setDelegate: self];
    [self.table setDataSource:self];
    [self.inputField setDelegate:self];
}

- (IBAction)didToggleSwitch:(id)sender {
    NSButtonCell *allowDuplicatesCell = sender;
    BOOL state = [allowDuplicatesCell state] == 1;
    [self.todoList setCanAddDuplicateItems: state];
}

-(void) controlTextDidChange:(NSNotification *)obj {
    NSString *text = [self.inputField stringValue];
    [self.addButton setEnabled: [self.todoList canAddItemWithTitle: text]];
    [self.removeButton setEnabled:[self.todoList hasItemWithTitle:text]];
}

- (IBAction)addInput:(id)sender {
    NSString *title = [self.inputField stringValue];
    if ([self.todoList canAddItemWithTitle: title]) {
        [self.todoList addItemWithTitle: title];
        [self updateTable];
    }
}

- (IBAction)removeInput:(id)sender {
    [self.todoList removeItemWithTitle: [self.inputField stringValue]];
    [self updateTable];
}

-(void) updateTable {
    [self.inputField setStringValue:@""];
    [self.table reloadData];
}

- (NSView *)tableView:(NSTableView *)tableView
   viewForTableColumn:(NSTableColumn *)tableColumn
                  row:(NSInteger)row {
    NSTableCellView *result = [tableView makeViewWithIdentifier:@"tableCellView" owner:self];
    result.textField.stringValue = [[self.todoList itemTitles] objectAtIndex:row];
    return result;
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [[self.todoList allItems] count];
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    CGFloat height = 50.0;
    return height;
}


@end
