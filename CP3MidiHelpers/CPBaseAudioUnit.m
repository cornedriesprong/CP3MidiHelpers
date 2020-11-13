//
//  CPBaseAudioUnit.m
//  CP3MidiHelpers
//
//  Created by Corné on 29/05/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

#import "CPBaseAudioUnit.h"
#import <AVFoundation/AVFoundation.h>

@implementation CPBaseAudioUnit

@synthesize parameterTree = _parameterTree;
@synthesize inputBus = _inputBus;
@synthesize outputBus = _outputBus;
@synthesize inputBusArray = _inputBusArray;
@synthesize outputBusArray = _outputBusArray;

BOOL hasMIDIOutput = YES;

AUHostMusicalContextBlock _musicalContext;
AUMIDIOutputEventBlock _outputEventBlock;
AUHostTransportStateBlock _transportStateBlock;
AUScheduleMIDIEventBlock _scheduleMIDIEventBlock;

AudioStreamBasicDescription asbd; // local copy of the asbd that the render block can capture

- (instancetype)initWithComponentDescription:(AudioComponentDescription)componentDescription
                                     options:(AudioComponentInstantiationOptions)options
                                       error:(NSError **)outError {
    
    self = [super initWithComponentDescription:componentDescription options:options error:outError];
    
    if (self == nil) {
        return nil;
    }
    
    // Create the parameter tree.
    _parameterTree = [AUParameterTree createTreeWithChildren:@[]];
    
    _messageQueue = [AEMessageQueue new];
    
    self.maximumFramesToRender = 256;
    
    AVAudioFormat *defaultFormat = [[AVAudioFormat alloc] initStandardFormatWithSampleRate:44100.0 channels:2];
    asbd = *defaultFormat.streamDescription;
    
    NSError* error;
    _inputBus = [[AUAudioUnitBus alloc] initWithFormat:defaultFormat error:&error];
    _outputBus = [[AUAudioUnitBus alloc] initWithFormat:defaultFormat error:&error];
    
    NSCAssert(error == NULL, @"Unable to create input/output busses. Error: %@", error);
    
    _inputBusArray  = [[AUAudioUnitBusArray alloc] initWithAudioUnit:self
                                                             busType:AUAudioUnitBusTypeInput
                                                              busses: @[_inputBus]];
    
    _outputBusArray = [[AUAudioUnitBusArray alloc] initWithAudioUnit:self
                                                             busType:AUAudioUnitBusTypeOutput
                                                              busses: @[_outputBus]];
    
    return self;
}

#pragma mark - AUAudioUnit Overrides

- (AUAudioUnitBusArray *)inputBusses {
    return _inputBusArray;
}

- (AUAudioUnitBusArray *)outputBusses {
    return _outputBusArray;
}

- (BOOL)allocateRenderResourcesAndReturnError:(NSError **)outError {
    
    if (![super allocateRenderResourcesAndReturnError:outError]) {
        return NO;
    }
    
    if (self.musicalContextBlock) {
        _musicalContext = self.musicalContextBlock;
    } else {
        return NO;
    }

    if (self.MIDIOutputEventBlock) {
        _outputEventBlock = self.MIDIOutputEventBlock;
    } else {
        return NO;
    }

    if (self.transportStateBlock) {
        _transportStateBlock = self.transportStateBlock;
    } else {
        return NO;
    }

    if (self.scheduleMIDIEventBlock) {
        _scheduleMIDIEventBlock = self.scheduleMIDIEventBlock;
    } else {
        return NO;
    }
    
    return YES;
}

- (void)deallocateRenderResources {
    [super deallocateRenderResources];
    
    _transportStateBlock    = nil;
    _outputEventBlock       = nil;
    _musicalContext         = nil;
    _scheduleMIDIEventBlock = nil;
}

- (NSArray<NSString *>*) MIDIOutputNames {
    return @[@"output"];
}

- (NSDictionary<NSString *,id> *)fullState {
    
    NSMutableDictionary *state = [[NSMutableDictionary alloc] initWithDictionary: super.fullState];
    state[@"data"] = [[self delegate] getData];
    
    return state;
}

- (void)setFullState:(NSDictionary<NSString *,id> *)fullState {
    
    NSData *data = (NSData *)fullState[@"data"];
    [[self delegate] setData:data];
}

- (NSDictionary<NSString *,id> *)fullStateForDocument {
    
    NSMutableDictionary *state = [[NSMutableDictionary alloc] initWithDictionary: super.fullStateForDocument];
    state[@"data"] = [[self delegate] getData];
    
    return state;
}

- (void)setFullStateForDocument:(NSDictionary<NSString *,id> *)fullStateForDocument {
    
    NSData *data = (NSData *)fullStateForDocument[@"data"];
    [[self delegate] setData:data];
}

- (void)receivedNoteOn:(int)pitch {
    //    [[self delegate] receivedNoteOn:pitch];
}

- (void)receivedNoteOff:(int)pitch {
    //    [[self delegate] receivedNoteOff:pitch];
}

@end
