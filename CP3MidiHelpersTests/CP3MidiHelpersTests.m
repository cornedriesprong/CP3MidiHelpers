//
//  CP3MidiHelpersTests.m
//  CP3MidiHelpersTests
//
//  Created by Corné on 29/05/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Helpers.h"

@interface CP3MidiHelpersTests : XCTestCase

@end

@implementation CP3MidiHelpersTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.\
    
}

- (void)testSubtickCount {
    // check if subtick count produces consecutive numbers
    for (double i = 0; i < PPQ; i++) {
        double beatPosition = (1.0 / PPQ) * i;
        int subtick = subtickCount(beatPosition);
        XCTAssertEqual(subtick, i);
    }
}

- (void)testSamplesPerBeat1 {
    
    double sampleRate = 48000;
    double tempo = 120;
    double samples = samplesPerBeat(sampleRate, tempo);
    double testValue = (sampleRate * 60.0) / tempo;
    XCTAssertEqual(samples, testValue);
}

- (void)testSamplesPerBeat2 {
    
    double sampleRate = 44100;
    double tempo = 97.121;
    double samples = samplesPerBeat(sampleRate, tempo);
    double testValue = (sampleRate * 60.0) / tempo;
    XCTAssertEqual(samples, testValue);
}


- (void)testSamplesPerSubtick1 {
    
    double sampleRate = 48000;
    double tempo = 120;
    double samples = samplesPerSubtick(sampleRate, tempo);
    double testValue = (sampleRate * 60.0) / tempo / PPQ;
    XCTAssertEqual(samples, testValue);
}

- (void)testSamplesPerSubtick2 {
    
    double sampleRate = 44100;
    double tempo = 97.421;
    double samples = samplesPerSubtick(sampleRate, tempo);
    double testValue = (sampleRate * 60.0) / tempo / PPQ;
    XCTAssertEqual(samples, testValue);
}

- (void)testSequencer {
    
    double sampleRate = arc4random_uniform(48000 - 44100) + 44100;
    double tempo = arc4random_uniform(320) + 80;
    double currentBeatPosition = 0.0;
    double frameCount = arc4random_uniform(2048 - 128) + 128;
    AUEventSampleTime now = 0;
    
    double previousTimestamp = 0;
    double previousDistance = 0;
    
    // check 512 * 512 samples == approx. 5 seconds of audio at 48 kHz
    for (double sampleTime = 0; sampleTime < (512 * 512); sampleTime += frameCount) {
        
        for (double outputTimestamp = sampleTimeForNextSubtick(sampleRate, tempo, now, currentBeatPosition);
             outputTimestamp <= (now + frameCount);
             outputTimestamp += samplesPerSubtick(sampleRate, tempo)) {
            
            double distance = outputTimestamp - previousTimestamp;
            
            if (previousDistance != 0)
                XCTAssertEqual(previousDistance, distance);
        }
        
        currentBeatPosition += (1.0 / samplesPerBeat(sampleRate, tempo)) * frameCount;
        now += frameCount;
    }
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
