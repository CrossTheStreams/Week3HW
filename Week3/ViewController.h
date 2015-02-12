//
//  ViewController.h
//  Week3
//
//  Created by Andrew Hautau on 1/29/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController <NSTableViewDelegate, NSTableViewDataSource,  NSTextFieldDelegate>

@property (weak) IBOutlet NSTableView *table;
@property (weak, nonatomic) IBOutlet NSTextField *inputField;
@property (weak, nonatomic) IBOutlet NSButton *addButton;
@property (weak, nonatomic) IBOutlet NSButton *removeButton;
@property (weak) IBOutlet NSButton *allowDuplicates;
@property (weak) IBOutlet NSButtonCell *allowDuplicatesCell;

@end

