//
//  CPMidiEvent.h
//  CP3MidiHelpers
//
//  Created by Corné on 31/05/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPMIDIEvent : NSObject

@property (atomic) int beat;
@property (atomic) int8_t subtick;
@property (atomic) int8_t channel;
@property (atomic) int8_t destination;

-(id)initWithBeat:(int)beat
          subtick:(int8_t)subtick
      destination:(int8_t)destination
          channel:(int8_t)channel;

@end

NS_ASSUME_NONNULL_END
