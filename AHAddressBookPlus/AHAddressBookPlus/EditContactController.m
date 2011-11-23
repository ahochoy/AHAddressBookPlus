//
//  EditContactController.m
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

#import "EditContactController.h"

@implementation EditContactController
@synthesize fieldCollection;
@synthesize datePicker;

@synthesize myBook, myCard;

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

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if( buttonIndex == 0 ){
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        
    }
    
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

-(IBAction)deleteContact:(id)sender{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"AThe message."  delegate:self cancelButtonTitle:@"Index 0" otherButtonTitles: @"Index 1", nil];
    [alert show];
    [alert release];
    
}

-(IBAction)doneWithContact:(id)sender{
    
}

- (void)viewDidLoad
{
    
    UIBarButtonItem *deleteButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                   target:self 
                                   action:@selector(deleteContact:)];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                   target:self 
                                   action:@selector(doneWithContact:)];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects: deleteButton, doneButton, nil];
    
    for (UILabel *lbl in fieldCollection) {
        switch (lbl.tag) {
            case FIRSTNAMEIDX:
                lbl.text = myCard.firstName;
                break;
            case LASTNAMEIDX:
                lbl.text = myCard.lastName;
                break;
            case ADDRESSIDX:
                lbl.text = myCard.fullAddress;
                break;
            case PHONEIDX:
                lbl.text = myCard.phoneNumber;
                break;
            case EMAILIDX:
                lbl.text = myCard.email;
                break;
            default:
                break;
        }
        
        datePicker.date = myCard.birthday;
        
    }
    
    [deleteButton release];
    [doneButton release];
    [super viewDidLoad];
    
    
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [self setFieldCollection:nil];
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
    [fieldCollection release];
    [datePicker release];
    [super dealloc];
}
@end
