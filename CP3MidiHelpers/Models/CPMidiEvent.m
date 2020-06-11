//
//  CPMidiEvent.m
//  CP3MidiHelpers
//
//  Created by Corné on 31/05/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

#import "CPMidiEvent.h"

@implementation CPMIDIEvent

-(id)initWithBeat:(int)beat
          subtick:(int8_t)subtick
      destination:(int8_t)destination
          channel:(int8_t)channel {
    
    self = [super init];
    if (self) {
        self.beat = beat;
        self.subtick = subtick;
        self.channel = channel;
        self.destination = destination;
    }
    return self;
}

@end
