//
//  AddressCard.h
//  AHAddressBookPlus
//
//  Created by Andrew HoChoy on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressCard : NSObject {
    
    NSString *firstName;
    NSString *lastName;
    NSString *fullAddress;
    NSString *phoneNumber;
    NSString *email;
    NSDate *birthday;
}

@property (nonatomic,retain) NSString *firstName, *lastName, *fullAddress, *phoneNumber, *email;
@property (nonatomic,retain) NSDate *birthday;

+(AddressCard *) blankCard;

@end
