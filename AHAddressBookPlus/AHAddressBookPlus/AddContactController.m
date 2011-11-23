//
//  AddContactController.m
//  AHAddressBookPlus
//
//  Created by Andrew HoChoy on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#define FIRSTNAMEIDX 0
#define LASTNAMEIDX 1
#define ADDRESSIDX 2
#define PHONEIDX 3
#define EMAILIDX 4
#define BDAYIDX 5

#import "AddContactController.h"


@implementation AddContactController

@synthesize fieldCollection, datePicker, myBook, myCard;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 */
-(IBAction)addContact:(id)sender{

    AddressCard *newCard = [[AddressCard alloc] init];
    
    for (UILabel *lbl in fieldCollection) {
        switch (lbl.tag) {
            case FIRSTNAMEIDX:
                newCard.firstName = lbl.text;
                break;
            case LASTNAMEIDX:
                newCard.lastName = lbl.text;
                break;
            case ADDRESSIDX:
                newCard.fullAddress = lbl.text;
                break;
            case PHONEIDX:
                newCard.phoneNumber = lbl.text;
                break;
            case EMAILIDX:
                newCard.email = lbl.text;
                break;
            default:
                break;
        }
        
        newCard.birthday = datePicker.date;
    }
    
    [self.myBook addCard:newCard];
    [self.myBook sortBook];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    NSArray *allControllers = self.navigationController.viewControllers;
    UITableViewController *parent = [allControllers lastObject];
    [parent.tableView reloadData];
    
    [newCard release];

}

- (void)viewDidLoad
{
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                  target:self 
                                  action:@selector(addContact:)];    
    
    self.navigationItem.rightBarButtonItem = doneButton;
    
    [doneButton release];
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
