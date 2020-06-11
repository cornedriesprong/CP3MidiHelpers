//
//  CPControlEvent.m
//  cykle-AUv3
//
//  Created by Corné on 19/05/2019.
//  Copyright © 2019 CP3. All rights reserved.
//

#import "CPControlEvent.h"

@implementation CPControlEvent

-(id)initWithBeat:(int)beat
          subtick:(int8_t)subtick
           number:(int8_t)number
            value:(int8_t)value
      destination:(int8_t)destination
          channel:(int8_t)channel {

    self = [super initWithBeat:beat
                       subtick:subtick
                   destination:destination
                       channel:channel];

    if (self) {
        self.number = number;
        self.value = value;
    }
    return self;
}

@end
