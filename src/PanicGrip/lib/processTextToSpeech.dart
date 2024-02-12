import "dart:core";
import "dart:async";
import "dart:io";
import "dart:ui";
import "dart:isolate";
import "dart:async";
import "actions.dart";
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:alarmplayer/alarmplayer.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:flutter_tts/flutter_tts.dart';

String? _newVoiceText = "Hi This is Panic Grip App";
   int? _inputLength;
String? language;
String? engine;
double volume = 0.5;
double pitch = 1.0;
double rate = 0.5;

//TtsState ttsState = TtsState.stopped;

Future _getDefaultEngine(FlutterTts flutterTts) async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

	Future _getDefaultVoice(FlutterTts flutterTts) async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {
      print(voice);
    }
  }

	Future _speak(FlutterTts flutterTts) async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    if (_newVoiceText != null) {
      if (_newVoiceText!.isNotEmpty) {
        await flutterTts.speak(_newVoiceText!);
      }
    }
  }

	Future _setAwaitOptions(FlutterTts flutterTts) async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future _stop(FlutterTts flutterTts) async {
    var result = await flutterTts.stop();
    //if (result == 1) ttsState = TtsState.stopped);
  }

  Future _pause(FlutterTts flutterTts) async {
    var result = await flutterTts.pause();
    //if (result == 1) ttsState = TtsState.paused);
  }

void processTextToSpeech() async
{
	FlutterTts flutterTts = FlutterTts();
	Future<dynamic> _getLanguages() async => await flutterTts.getLanguages;
  Future<dynamic> _getEngines() async => await flutterTts.getEngines;

	_getDefaultEngine(flutterTts);
  _getDefaultVoice(flutterTts);

	print("TTS ");
}
