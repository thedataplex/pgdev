import "dart:core";
import "dart:async";
import "dart:io";
import "dart:ui";
import "dart:isolate";
import 'package:flutter/services.dart';
import "package:flutter/material.dart";
import "package:geolocator/geolocator.dart";
import 'package:torch_light/torch_light.dart';
import 'package:flutter_isolate/flutter_isolate.dart';

//Local files
import "PGFlashlight.dart";
import "PGAlarm.dart";
import "PGLocation.dart";
import "PGCamera.dart";
import "PGSettings.dart";
import "PGTextToSpeech.dart";


int pbcnt = 0;
bool panicon = false;
void processPanicButton(BuildContext context)
{
	pbcnt = pbcnt + 1;
	print("PanicButton Pressed [$pbcnt] Times");
	//_showcontent(context);
	processFlashlightButton(context);
	processAlarmButton(context);
	processLocationButton(context);
}
