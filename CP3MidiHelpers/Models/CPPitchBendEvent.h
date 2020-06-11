//
//  CPPitchBendEvent.h
//  cykle
//
//  Created by Corné on 23/05/2019.
//  Copyright © 2019 CP3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPMidiEvent.h"

@interface CPPitchBendEvent : CPMIDIEvent

@property (atomic) long value;

- (id)initWithBeat:(int)beat
           subtick:(int8_t)subtick
             value:(long)value
       destination:(int8_t)destination
           channel:(int8_t)channel;

@end

