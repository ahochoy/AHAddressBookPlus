//
//  AddressBook.m
//  AHAddressBookPlus
//
//  Created by Andrew HoChoy on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AddressBook.h"

#define FIRSTNAMEIDX 0
#define LASTNAMEIDX 1
#define ADDRESSIDX 2
#define PHONEIDX 3
#define EMAILIDX 4
#define BDAYIDX 5

@implementation AddressBook

@synthesize book, path;

- (id)init{
    self = [super init];
    if(self) {
        
        self.path = [[NSBundle mainBundle] pathForResource: @"Contacts"
                                                         ofType: @"plist"];
        
        NSMutableArray *pArray = [[NSMutableArray alloc] initWithContentsOfFile: path];
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        
        for (NSArray *arr in pArray) {
            
            AddressCard *tempCard = [[AddressCard alloc] init];
            
            tempCard.firstName = [arr objectAtIndex:FIRSTNAMEIDX];
            tempCard.lastName = [arr objectAtIndex:LASTNAMEIDX];
            tempCard.fullAddress = [arr objectAtIndex:ADDRESSIDX];
            tempCard.phoneNumber = [arr objectAtIndex:PHONEIDX];
            tempCard.email = [arr objectAtIndex:EMAILIDX];
            tempCard.birthday = [arr objectAtIndex:BDAYIDX];
                                                                 
            [temp addObject: tempCard];
            
            [tempCard release];
        }
        
        self.book = temp;
        [self sortBook];
        
        [temp release];
        [pArray release];
        [path release];
    }
    return self;
}

-(void) addCard: (AddressCard *) theCard{
    
    [book addObject: theCard];
    NSLog(@"Count now: %d", [self entries]);
}

-(void) removeCard: (AddressCard *) theCard{
    
    [book removeObject: theCard];
}

-(void) removeCardatIndex: (NSUInteger) position{
    
    [book removeObjectAtIndex: position];
}

-(void) sortBook{
    
    NSSortDescriptor *fName = [[[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES]autorelease];
    NSSortDescriptor *lName = [[[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES]autorelease];
    
    [book sortUsingDescriptors:[NSArray arrayWithObjects: fName, lName, nil]];
}

-(void) swapCardAtIndex: (NSUInteger) position with: (AddressCard*) thisCard{
    
    [book replaceObjectAtIndex: position withObject: thisCard];
    
}

-(AddressCard *) getCardAtIndex: (NSUInteger) position{
    
    return [book objectAtIndex: position];
}

-(int) entries{
    
    return [book count];
}

-(void)dealloc{
    
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    
    for (AddressCard *card in book) {
        
        NSMutableArray *cardArr = [[NSMutableArray alloc] init];
        
        [cardArr insertObject:card.firstName atIndex:FIRSTNAMEIDX];
        [cardArr insertObject:card.lastName atIndex:LASTNAMEIDX];
        [cardArr insertObject:card.fullAddress atIndex:ADDRESSIDX];
        [cardArr insertObject:card.phoneNumber atIndex:PHONEIDX];
        [cardArr insertObject:card.email atIndex:EMAILIDX];
        [cardArr insertObject:card.birthday atIndex:BDAYIDX];
        
        [temp addObject: cardArr];
        
        [cardArr release];
    }
    
    [temp writeToFile:path atomically:YES];
    
    [temp release];
    [book release];
    
    [super dealloc];
}


@end
