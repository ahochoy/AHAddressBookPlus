//
//  RootViewController.h
//  AHAddressBookPlus
//
//  Created by andrew s hochoy on 11/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressBook.h"

@interface RootViewController : UITableViewController {
    
    AddressBook *myBook;

}

@property (nonatomic, retain) AddressBook *myBook;

-(IBAction)addNew:(id)sender;

@end
