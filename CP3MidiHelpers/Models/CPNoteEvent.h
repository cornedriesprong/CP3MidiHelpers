//
//  CPNoteEvent.h
//  cykle
//
//  Created by Corné on 02/05/2019.
//  Copyright © 2019 CP3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPMidiEvent.h"

@interface CPNoteEvent : CPMIDIEvent

@property (atomic) int8_t pitch;
@property (atomic) int8_t velocity;
@property (atomic) int8_t duration;

- (id)initWithBeat:(int)beat
           subtick:(int8_t)subtick
             pitch:(int8_t)pitch
          velocity:(int8_t)velocity
          duration:(int8_t)duration
       destination:(int8_t)destination
           channel:(int8_t)channel;

@end
