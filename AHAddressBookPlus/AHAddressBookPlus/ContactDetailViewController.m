//
//  ContactDetailView.m
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

#import "ContactDetailViewController.h"
#import "EditContactController.h"

@implementation ContactDetailViewController

@synthesize labelCollection, datePicker, myBook, thisCard;

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

-(IBAction)editContact:(id)sender{
 
    EditContactController *childController = [[EditContactController alloc] initWithNibName:@"ContactEditView" bundle:nil];
	
    childController.title = @"Add New Person...";
    childController.myCard = self.thisCard;
    childController.myBook = self.myBook;
	
    [self.navigationController pushViewController:childController
										 animated:YES];
    [childController release];
    
}

- (void)viewDidLoad
{
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                   target:self 
                                   action:@selector(editContact:)];
    
    
    self.navigationItem.rightBarButtonItem  = editButton;
    
    for (UILabel *lbl in labelCollection) {
        switch (lbl.tag) {
            case FIRSTNAMEIDX:
                lbl.text = thisCard.firstName;
                break;
            case LASTNAMEIDX:
                lbl.text = thisCard.lastName;
                break;
            case ADDRESSIDX:
                lbl.text = thisCard.fullAddress;
                break;
            case PHONEIDX:
                lbl.text = thisCard.phoneNumber;
                break;
            case EMAILIDX:
                lbl.text = thisCard.email;
                break;
            default:
                break;
        }
        
        datePicker.date = thisCard.birthday;
    
    }
    
    [editButton release];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setLabelCollection:nil];
    [self setDatePicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (void)dealloc {
    [labelCollection release];
    [datePicker release];
    [super dealloc];
}
@end
