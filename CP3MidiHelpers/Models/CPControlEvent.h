//
//  CPControlEvent.h
//  cykle
//
//  Created by Corné on 19/05/2019.
//  Copyright © 2019 CP3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPMidiEvent.h"

@interface CPControlEvent : CPMIDIEvent

@property (atomic) int8_t number;
@property (atomic) int8_t value;

-(id)initWithBeat:(int)beat
          subtick:(int8_t)subtick
           number:(int8_t)number
            value:(int8_t)value
      destination:(int8_t)destination
          channel:(int8_t)channel;

@end
