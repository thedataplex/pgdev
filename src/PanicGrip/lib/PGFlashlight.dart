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
import 'package:go_router/go_router.dart';

//Local files
import "actions.dart"; 
import "PGStyles.dart";
import "PGInit.dart";  
import "PGHeader.dart";
import "PGFooter.dart";
import "PGWidget.dart";

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

Widget getFlashlightWidget()
{
	return getCenterWidget();
}

class DPFlashlightScreen extends StatefulWidget {
	DPFlashlightScreen({Key? key}) : super(key: key);
	@override
	State<DPFlashlightScreen> createState() => _DPFlashlightScreenState();
}

class _DPFlashlightScreenState extends State<DPFlashlightScreen> {

	@override
	Widget build(BuildContext context) {
		String titlestr = "Flashlight Details";
		return Scaffold(
			appBar: getAppBar( titlestr),
			body: getFlashlightWidget(),
			bottomNavigationBar: getBottomAppBar(context),
		);
	}
}

FutureOr<bool> ExitDPFlashlightScreen(BuildContext context)
{
	dpthread?.kill();
	disableTorch();
	print("Exit: Flashlight Screen. Flashlight OFF");
	return true;
}

void processFlashlightButton(BuildContext context) async
{
	fbcnt = fbcnt + 1;
	final resultPort = ReceivePort();
	//print("FlashlightButton Pressed [$fbcnt] Times");
	context.go('/flashlight');
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
