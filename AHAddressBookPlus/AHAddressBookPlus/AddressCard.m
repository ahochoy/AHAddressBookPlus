//
//  AddressCard.m
//  AHAddressBookPlus
//
//  Created by Andrew HoChoy on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AddressCard.h"

@implementation AddressCard

@synthesize firstName, lastName, fullAddress, phoneNumber, email, birthday;

+(AddressCard *)blankCard {
    
    AddressCard *toReturn = [[[AddressCard alloc]init] autorelease];
    
    toReturn.firstName = @"";
    toReturn.lastName = @"";
    toReturn.fullAddress = @"";
    toReturn.email = @"";
    toReturn.phoneNumber = @"";
    toReturn.birthday = [NSDate date];
    return toReturn;
}

@end
