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

import "dart:async";    
import "dart:io";    
import 'dart:typed_data';    
import "package:flutter/material.dart";    
import 'package:permission_handler/permission_handler.dart';    
import 'package:flutter_blue_plus/flutter_blue_plus.dart';    
import 'package:path_provider/path_provider.dart';    

int sbcnt = 0;

void processSettingsButton() async
{
	sbcnt = sbcnt + 1;
	print("SettingsButton Pressed [$sbcnt] Times");
	await openAppSettings();
}
