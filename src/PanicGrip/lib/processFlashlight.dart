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


int fbcnt = 0;
bool torchon = false;
FlutterIsolate? dpthread;

@pragma('vm:entry-point')
Future<void> toggleTorch(String  argport) async 
{
	bool cont = true;
	while(cont == true) {
		try {
			await TorchLight.enableTorch();
		} on Exception catch (_) {
			print('Could not enable torch');
			break;
		}
		sleep(Duration(milliseconds:500));
		try {
			await TorchLight.disableTorch();
		} on Exception catch (_) {
			print('Could not disable torch');
		}
		sleep(Duration(milliseconds:500));
	}
}

Future<void> enableTorch(String  argport) async 
{
	bool cont = true;
	while(cont == true) {
		try {
			await TorchLight.enableTorch();
		} on Exception catch (_) {
			print('Could not enable torch');
			break;
		}
	}
}

Future<void> disableTorch() async 
{
	try {
		await TorchLight.disableTorch();
		torchon = false;
	} on Exception catch (_) {
		print('Could not disable torch');
	}
}

void processFlashlightButton() async
{
	fbcnt = fbcnt + 1;
	final resultPort = ReceivePort();
	//print("FlashlightButton Pressed [$fbcnt] Times");
	if (torchon == true) {
		dpthread?.kill();
		disableTorch();
		print("Flashlight OFF");
	} else {
		torchon = true;
		dpthread = await FlutterIsolate.spawn(toggleTorch, "hello world");
		print("Flashlight ON");
	}
	
}
