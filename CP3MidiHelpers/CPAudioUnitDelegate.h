//
//  CPAudioUnitDelegate.h
//  CP3MidiHelpers
//
//  Created by Corné on 29/05/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CPAudioUnitDelegate <NSObject>
- (NSData *)getData;
- (void)setData:(NSData *)data;
@end
