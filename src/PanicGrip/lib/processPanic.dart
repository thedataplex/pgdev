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
import "processFlashlight.dart";
import "processCamera.dart";
import "processAlarm.dart";
import "processLocation.dart";


int pbcnt = 0;
bool panicon = false;
void processPanicButton()
{
	pbcnt = pbcnt + 1;
	print("PanicButton Pressed [$pbcnt] Times");
	//_showcontent(context);
	processFlashlightButton();
	processAlarmButton();
	processLocationButton();
}
