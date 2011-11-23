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
#import "ContactDetailViewController.h"
#import "RootViewController.h"

@implementation EditContactController
@synthesize fieldCollection;
@synthesize datePicker;

@synthesize myBook, myCard, idx;

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


//Delegate method for response to UIAlertView - user can confirm deletion of Contact
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if( buttonIndex == 0 ){
        
        NSLog(@"Count Before: %d", [self.myBook entries]);
        [self.myBook removeCardatIndex:idx];
        NSLog(@"Count After: %d", [self.myBook entries]);
        
        
        RootViewController *root = (RootViewController*)[self.navigationController.viewControllers objectAtIndex:0];
        root.myBook = self.myBook;
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        [root.tableView reloadData];
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

//IBaction that responds to Delete (Trash) can Nav Button
-(IBAction)deleteContact:(id)sender{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Delete Contact" 
                                                    message:@"Are You Sure You Wanted to Delete this Contact?"  
                                                   delegate:self 
                                          cancelButtonTitle:@"Yes" 
                                          otherButtonTitles: @"No", nil];
    [alert show];
    [alert release];
    
}
//IBAction that responds to being done with contact editting
-(IBAction)doneWithContact:(id)sender{
    
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
    
    NSLog(@"New First Name: %@", newCard.firstName);
    
    [self.myBook swapCardAtIndex:self.idx with:newCard];
    [self.myBook sortBook];
    self.myCard = newCard;
    
    [self.navigationController popViewControllerAnimated:YES];
    
    /*NSArray *allControllers = self.navigationController.viewControllers;
    ContactDetailViewController *parent = [allControllers lastObject];
    [parent viewWillAppear:YES];*/
    
    [newCard release];
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
