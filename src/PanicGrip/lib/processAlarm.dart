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

int abcnt = 0;
bool alarmon = false;

FlutterIsolate? dpThreadAlarm;

@pragma('vm:entry-point')
Future<void> startAlarm(String argport) async
{ 
	await AudioPlayer().play(AssetSource("audio/alarm.mp3"));
}


void processAlarmButton() async
{
	abcnt = abcnt + 1;
	print("AlarmButton Pressed [$abcnt] Times");
	if (alarmon == true) {
		await AudioPlayer().stop();
		dpThreadAlarm?.kill();
		alarmon = false;
		print("Alarm OFF");
	} else {
		alarmon = true;
		dpThreadAlarm = await FlutterIsolate.spawn(startAlarm, "hello world");
		print("Alarm ON");
	}
}
