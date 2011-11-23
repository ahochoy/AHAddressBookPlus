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

@synthesize labelCollection, datePicker, myBook, myCard, idx;

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

//IBAction that responds to user pressing the Edit Button, loads new view into window with appropriate properties
-(IBAction)editContact:(id)sender{
 
    EditContactController *childController = [[EditContactController alloc] initWithNibName:@"ContactEditView" bundle:nil];
	
    childController.title = @"Edit Contact";
    childController.myCard = self.myCard;
    childController.myBook = self.myBook;
    childController.idx = self.idx;
	
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
                lbl.text = self.myCard.firstName;
                break;
            case LASTNAMEIDX:
                lbl.text = self.myCard.lastName;
                break;
            case ADDRESSIDX:
                lbl.text = self.myCard.fullAddress;
                break;
            case PHONEIDX:
                lbl.text = self.myCard.phoneNumber;
                break;
            case EMAILIDX:
                lbl.text = self.myCard.email;
                break;
            default:
                break;
        }
        
        datePicker.date = self.myCard.birthday;
    
    }
    
    [editButton release];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


//Attempts to keep view fresh with most current information
-(void)viewDidAppear:(BOOL)animated{
    for (UILabel *lbl in labelCollection) {
        switch (lbl.tag) {
            case FIRSTNAMEIDX:
                lbl.text = self.myCard.firstName;
                break;
            case LASTNAMEIDX:
                lbl.text = self.myCard.lastName;
                break;
            case ADDRESSIDX:
                lbl.text = self.myCard.fullAddress;
                break;
            case PHONEIDX:
                lbl.text = self.myCard.phoneNumber;
                break;
            case EMAILIDX:
                lbl.text = self.myCard.email;
                break;
            default:
                break;
        }
        
        datePicker.date = self.myCard.birthday;
    }

    [super viewDidAppear:animated];
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
