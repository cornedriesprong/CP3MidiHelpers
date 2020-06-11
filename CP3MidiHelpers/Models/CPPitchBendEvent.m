//
//  CPPitchBendEvent.m
//  cykle-AUv3
//
//  Created by Corné on 23/05/2019.
//  Copyright © 2019 CP3. All rights reserved.
//

#import "CPPitchBendEvent.h"

@implementation CPPitchBendEvent

- (id)initWithBeat:(int)beat
           subtick:(int8_t)subtick
             value:(long)value
       destination:(int8_t)destination
           channel:(int8_t)channel {

    self = [super initWithBeat:beat
                       subtick:subtick
                   destination:destination
                       channel:channel];

    if (self) {
        self.value = value;
    }
    return self;
}

@end
