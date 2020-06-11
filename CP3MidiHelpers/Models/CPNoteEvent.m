//
//  CPNoteEvent.m
//  cykle-AUv3
//
//  Created by Corné on 02/05/2019.
//  Copyright © 2019 CP3. All rights reserved.
//

#import "CPNoteEvent.h"

@implementation CPNoteEvent

- (id)initWithBeat:(int)beat
           subtick:(int8_t)subtick
             pitch:(int8_t)pitch
          velocity:(int8_t)velocity
          duration:(int8_t)duration
       destination:(int8_t)destination
           channel:(int8_t)channel {

    self = [super initWithBeat:beat
                       subtick:subtick
                   destination:destination
                       channel:channel];

    if (self) {
        self.pitch = pitch;
        self.velocity = velocity;
        self.duration = duration;
    }
    return self;
}

@end
