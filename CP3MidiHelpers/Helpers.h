//
//  Helpers.h
//  CP3MidiHelpers
//
//  Created by Corné on 29/05/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "TPCircularBuffer.h"

#define NOTE_ON             0x90
#define NOTE_OFF            0x80
#define CC                  0xB0
#define PITCH_BEND          0xE0
#define PROGRAM_CHANGE      0xE0
#define MIDI_CLOCK          0xF8
#define MIDI_CLOCK_START    0xFA
#define MIDI_CLOCK_CONTINUE 0xFA
#define MIDI_CLOCK_STOP     0xFC
#define PPQ                 96

typedef struct MIDIEvent {
    int beat;
    int subtick;
    uint8_t status;
    uint8_t data1;
    uint8_t data2;
    int duration;   // only relevant for note events
    int destination;
    int channel;
    bool isQueued;
} MIDIEvent;

typedef struct BeatPosition {
    int beat;
    int subtick;
} BeatPosition;

typedef struct PlayingNote {
    int pitch;
    int beat;
    int subtick;
    int channel;
    int destination;
    bool hasStopped;
} PlayingNote;

// compiler directive to make C functions callable from (Objective-)C++
#ifdef __cplusplus
extern "C" {
#endif
    void processEventList(const AURenderEvent *realtimeEventListHead);
    double samplesPerBeat(double sampleRate, double tempo);
    double samplesPerSubtick(double sampleRate, double tempo);
    double sampleTimeForNextSubtick(double sampleRate, double tempo, AUEventSampleTime sampleTime, double beatPosition);
    int subtickCount(double beatPosition);
    void getMidiEventsFromBuffer(MIDIEvent *result[], TPCircularBuffer *buffer);
#ifdef __cplusplus
}
#endif
