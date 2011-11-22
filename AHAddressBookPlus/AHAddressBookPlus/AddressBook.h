//
//  AddressBook.h
//  AHAddressBookPlus
//
//  Created by Andrew HoChoy on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressCard.h"

@interface AddressBook : NSObject {
    
    NSMutableArray *book;
    NSString *path;
    
}

@property (nonatomic, retain) NSMutableArray *book;
@property (nonatomic, retain) NSString *path;

-(id) init;
-(void) addCard: (AddressCard *) theCard;
-(void) removeCard: (AddressCard *) theCard;
-(void) removeCardatIndex: (NSUInteger) position;
-(void) swapCardAtIndex: (NSUInteger) position with: (AddressCard*) thisCard;

-(AddressCard *) getCardAtIndex: (NSUInteger) position;

-(void) sortBook;
-(int) entries;


@end
