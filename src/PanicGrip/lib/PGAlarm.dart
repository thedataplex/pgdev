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
import 'package:go_router/go_router.dart';

//Local files
import "actions.dart"; 
import "PGStyles.dart";
import "PGInit.dart";
import "PGHeader.dart";
import "PGFooter.dart";
import "PGWidget.dart";

int abcnt = 0;
bool alarmon = false;

FlutterIsolate? dpThreadAlarm;

@pragma('vm:entry-point')
Future<void> startAlarm(String argport) async
{ 
	await AudioPlayer().play(AssetSource("audio/alarm.mp3"));
}

FutureOr<bool> ExitDPAlarmScreen(BuildContext context) async
{    
	await AudioPlayer().stop();
	dpThreadAlarm?.kill();
	alarmon = false;
  print("Exit: Alarm Screen. Alarm OFF");                   
  return true;    
}

Widget getAlarmWidget()
{
  return getCenterWidget();
}


class DPAlarmScreen extends StatefulWidget {  
	DPAlarmScreen({Key? key}) : super(key: key);
	@override
	State<DPAlarmScreen> createState() => _DPAlarmScreenState();
}

class _DPAlarmScreenState extends State<DPAlarmScreen> {

	@override
	Widget build(BuildContext context) {
		String titlestr = "Alarm Details";
		return Scaffold(
			appBar: getAppBar( titlestr),
			body: getAlarmWidget(),
			bottomNavigationBar: getBottomAppBar(context),
		);
  }
}    

void processAlarmButton(BuildContext context) async
{
	abcnt = abcnt + 1;
	print("AlarmButton Pressed [$abcnt] Times");
	context.go('/alarm');
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
