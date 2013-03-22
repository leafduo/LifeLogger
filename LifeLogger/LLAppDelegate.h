//
//  LLAppDelegate.h
//  LifeLogger
//
//  Created by leafduo on 3/22/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface LLAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;

@end
