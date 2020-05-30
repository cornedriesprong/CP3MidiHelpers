//
//  CPBaseAudioUnit.h
//  CP3MidiHelpers
//
//  Created by Corné on 29/05/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import "AEMessageQueue.h"
#import "CPAudioUnitDelegate.h"
#import "Helpers.h"

@interface CPBaseAudioUnit : AUAudioUnit {
    @public AEMessageQueue *_messageQueue;
}

@property (nonatomic, readwrite) AUParameterTree *parameterTree;

@property AUAudioUnitBus *inputBus;
@property AUAudioUnitBus *outputBus;
@property AUAudioUnitBusArray *inputBusArray;
@property AUAudioUnitBusArray *outputBusArray;

@property (nonatomic, weak) id <CPAudioUnitDelegate> delegate;

@end
