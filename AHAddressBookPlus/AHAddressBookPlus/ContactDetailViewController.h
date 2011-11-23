//
//  ContactDetailView.h
//  AHAddressBookPlus
//
//  Created by Andrew HoChoy on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressBook.h"
@interface ContactDetailViewController : UIViewController{
    
    AddressBook *myBook;
    AddressCard *thisCard;
    
}
@property (retain, nonatomic) IBOutletCollection(UILabel) NSArray *labelCollection;
@property (retain, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (nonatomic, retain) AddressBook *myBook;
@property (nonatomic, retain) AddressCard *thisCard;

@end
