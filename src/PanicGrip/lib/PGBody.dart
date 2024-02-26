import "dart:async";
import "dart:isolate";
import "package:flutter/material.dart";
import "package:geolocator/geolocator.dart";
import "package:geolocator/geolocator.dart";
import "package:flutter_device_type/flutter_device_type.dart";
import 'package:torch_light/torch_light.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:go_router/go_router.dart';

//Local Files
import "PGStyles.dart";
import "PGHeader.dart";
import "PGFooter.dart";
import "PGInit.dart";
import "PGButton.dart";
import "PGWidget.dart";
import "actions.dart";
import "PGAlarm.dart";
import "PGFlashlight.dart";
import "PGLocation.dart";
import "PGCamera.dart";
import "PGSettings.dart";
import "PGTextToSpeech.dart";
import "PGPanic.dart";

const String dptitle = "DataPlex PanicGrip";

Widget getBody(BuildContext context)
{
	return Container(
		//color: Colors.lightBlueAccent,
		//color: Colors.brown.shade900,
		//color: footer_background_color,
		//color: Colors.orangeAccent,
		//color: Colors.deepOrange.shade400,
		//height: 1,
		decoration: BoxDecoration(
			shape: BoxShape.rectangle,
			//border: new BoxBorder(),
			color: Colors.red,
			border: Border.all(
				color: Colors.red,
				width: 5,
			),
		), 
		color: Colors.orange.shade100,
		//padding: EdgeInsets.all(0.5),
		child: GridView.count(
			primary: false,
			childAspectRatio: 1.2,
			padding: const EdgeInsets.all(20),
			crossAxisSpacing: 10,
			mainAxisSpacing: 10,
			crossAxisCount: 2,
			children: <Widget>[

					Container(
						padding: const EdgeInsets.all(8),
						color: header_background_color,
						child: getElevatedButtonIcon(context, processAlarmButton, 'Alarm', style2, Icons.access_alarms),
					), //Container

					Container(
						padding: const EdgeInsets.all(8),
						color: header_background_color,
						child: getElevatedButtonIcon(context, processFlashlightButton, 'Flashlight', style2, Icons.flashlight_on_sharp),
					), //Container

					Container(
						padding: const EdgeInsets.all(8),
						color: header_background_color,
						child: getElevatedButtonIcon(context, processRearCameraButton, 'Camera', style2, Icons.camera_alt_outlined),
					), //Container

					Container(
						padding: const EdgeInsets.all(8),
						color: header_background_color,
						child: getElevatedButtonIcon(context, processLocationButton, 'Location', style2, Icons.add_location_alt_sharp),
					), //Container

					Container(
						padding: const EdgeInsets.all(8),
						color: header_background_color,
						child: getElevatedButtonIcon(context, processFlashlightButton, 'Flashlight', style2, Icons.flashlight_on_sharp),
					), //Container

					Container(
						padding: const EdgeInsets.all(8),
						color: header_background_color,
						child: getElevatedButtonIcon(context, processTextToSpeech, 'Text/SMS', style2, Icons.sms),
					), //Container

					Container(
						padding: const EdgeInsets.all(8),
						color: header_background_color,
						child: getElevatedButtonIcon(context, processCallButton, 'Call', style2, Icons.add_call),
					), //Container

					Container(
						padding: const EdgeInsets.all(8),
						color: header_background_color,
						child: getElevatedButtonIcon(context, processSettingsButton, 'Settings', style2, Icons.settings),
					), //Container

					/*
					Container(
						padding: const EdgeInsets.all(8),
						color: Colors.teal[600],
						child: ElevatedButton.icon(
							style: style,
							onPressed: () {processSettingsButton(context);},
							label: const Text('PANIC'),
							icon: Icon(Icons.app_settings_alt),
						),
					), //Container
					*/
				],
			) //GridView.count
		); //body: Container
}
