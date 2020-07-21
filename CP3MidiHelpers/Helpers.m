//
//  Helpers.m
//  CP3MidiHelpers
//
//  Created by Corné on 29/05/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

#import "Helpers.h"

//void processEventList(const AURenderEvent *realtimeEventListHead) {
//    
//    while (realtimeEventListHead) {
//        
//        if (realtimeEventListHead->head.eventType == AURenderEventMIDI) {
//            AUMIDIEvent *midiEvent = (AUMIDIEvent*)realtimeEventListHead;
//            uint8_t status = midiEvent->data[0] & 0xf0;
//            if (status == NOTE_OFF || (status == NOTE_ON && midiEvent->data[2] == 0)) {
//            
//            } else if (status == NOTE_ON) {
//                
//            } else if (status == PROGRAM_CHANGE) {
//                
//            }
//            realtimeEventListHead = realtimeEventListHead->head.next;
//        }
//    }
//}
//
//double samplesPerBeat(double sampleRate, double tempo) {
//    return (sampleRate * 60.0) / tempo;
//}
//
//double samplesPerSubtick(double sampleRate, double tempo) {
//    return samplesPerBeat(sampleRate, tempo) / PPQ;
//}
//
//int64_t sampleTimeForNextSubtick(double sampleRate,
//                                 double tempo,
//                                 AUEventSampleTime sampleTime,
//                                 double beatPosition) {
//    
//    double transportTimeToNextBeat;
//    if (ceil(beatPosition) == beatPosition) {
//        transportTimeToNextBeat = 1;
//    } else {
//        transportTimeToNextBeat = ceil(beatPosition) - beatPosition;
//    }
//    double samplesToNextBeat = transportTimeToNextBeat * samplesPerBeat(sampleRate, tempo);
//    double nextBeatSampleTime = sampleTime + samplesToNextBeat;
//    int subticksLeftInBeat = PPQ - subtickCount(beatPosition);
//    return nextBeatSampleTime - (subticksLeftInBeat * samplesPerSubtick(sampleRate, tempo));
//}
//
//int subtickCount(double beatPosition) {
//    
//    double integral;
//    double fractional = modf(beatPosition, &integral);
//    return ceil(PPQ * fractional);
//}
//
//void getMidiEventsFromBuffer(MIDIEvent *result[], TPCircularBuffer *buffer) {
//    
//    uint32_t bytes = -1;
//    int i = 0;
//    
//    while (bytes != 0) {
//        MIDIEvent *event = (MIDIEvent *)TPCircularBufferTail(&buffer, &bytes);
//        if (event) {
//            MIDIEvent newEvent;
//            newEvent.beat = event->beat;
//            newEvent.subtick = event->subtick;
//            newEvent.status = event->status;
//            newEvent.data1 = event->data1;
//            newEvent.data2 = event->data2;
//            newEvent.duration = event->duration;
//            newEvent.channel = event->channel;
//            newEvent.destination = event->destination;
//            newEvent.isQueued = event->isQueued;
//            result[i] = &newEvent;
//            i++;
//            TPCircularBufferConsume(&buffer, sizeof(MIDIEvent));
//        }
//    }
//}
