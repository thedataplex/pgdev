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
import "actions.dart";
import "PGAlarm.dart";
import "PGFlashlight.dart";
import "PGLocation.dart";
import "processCamera.dart";
import "processSettings.dart";
import "processTextToSpeech.dart";
import "processPanic.dart";

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
						decoration: BoxDecoration(
							shape: BoxShape.rectangle,
							//border: new BoxBorder(),
							color: Colors.red,
							border: Border.all(
            		color: Colors.red,
            		width: 5,
          		),
						), 
						padding: const EdgeInsets.all(8),
							//color: Colors.blueAccent.shade400,
							//color: Colors.lightBlueAccent,
							//color: Colors.orangeAccent,
							color: header_background_color,
							child: ElevatedButton.icon(
							//child: IconButton(
								style: style2,
								onPressed: () {
									processAlarmButton(context);
								},
								label: const Text('Alarm'),
								icon: Icon(Icons.access_alarms),
							),
					), //Container

					Container(
						padding: const EdgeInsets.all(8),
							//color: Colors.blueAccent.shade400,
							//color: Colors.lightBlueAccent,
							//color: Colors.orangeAccent,
							color: header_background_color,
							child: ElevatedButton.icon(
								style: style2,
								onPressed: () {
									processFlashlightButton(context);
								},
								label: const Text('Flashlight'),
								icon: Icon(Icons.flashlight_on_sharp),
							),
					), //Container

					Container(
						padding: const EdgeInsets.all(8),
							//color: Colors.blueAccent.shade400,
							//color: Colors.orangeAccent,
							color: header_background_color,
							child: ElevatedButton.icon(
								style: style2,
								onPressed: () {processRearCameraButton();},
								label: const Text('Camera'),
								icon: Icon(Icons.camera_alt_outlined),
						),
					), //Container

					Container(
						padding: const EdgeInsets.all(8),
							//color: Colors.blueAccent.shade400,
							//color: Colors.orangeAccent,
							color: header_background_color,
							child: ElevatedButton.icon(
								style: style2,
								onPressed: () {
									processLocationButton(context);
								},
								label: const Text('Location'),
								icon: Icon(Icons.add_location_alt_sharp),
							),
					), //Container

					Container(
						padding: const EdgeInsets.all(8),
							//color: Colors.blueAccent.shade400,
							//color: Colors.orangeAccent,
							color: header_background_color,
							child: ElevatedButton.icon(
							style: style2,
							onPressed: () {processFlashlightButton(context);},
							label: const Text('Flashlight'),
							icon: Icon(Icons.flashlight_on_sharp),
						),
					), //Container

					Container(
						padding: const EdgeInsets.all(8),
							//color: Colors.blueAccent.shade400,
							//color: Colors.orangeAccent,
							color: header_background_color,
							child: ElevatedButton.icon(
							style: style2,
							onPressed: () {processTextToSpeech();},
							label: const Text('Text/SMS'),
							icon: Icon(Icons.sms),
						),
					), //Container

					Container(
						padding: const EdgeInsets.all(8),
							//color: Colors.blueAccent.shade400,
							//color: Colors.orangeAccent,
							color: header_background_color,
							child: ElevatedButton.icon(
							style: style2,
							onPressed: () {processCallButton(context);},
							label: const Text('Call'),
							icon: Icon(Icons.add_call),
						),
					), //Container

					Container(
						padding: const EdgeInsets.all(8),
							//color: Colors.blueAccent.shade400,
							//color: Colors.orangeAccent,
							color: header_background_color,
							child: ElevatedButton.icon(
							style: style2,
							onPressed: () {processSettingsButton();},
							label: const Text('Settings'),
							icon: Icon(Icons.settings),
						),
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
