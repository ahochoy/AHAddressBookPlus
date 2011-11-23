//
//  EditContactController.h
//  AHAddressBookPlus
//
//  Created by Andrew HoChoy on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressBook.h"

@interface EditContactController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate> {

    AddressBook *myBook;
    AddressCard *myCard;
    
}
@property (retain, nonatomic) IBOutletCollection(UITextField) NSArray *fieldCollection;
@property (retain, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (nonatomic, retain) AddressBook *myBook;
@property (nonatomic, retain) AddressCard *myCard;

@end
