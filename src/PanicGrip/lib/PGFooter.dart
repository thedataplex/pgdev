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
import "processPanic.dart";

Widget getFooter(BuildContext context)
{

	return BottomAppBar(
		color: footer_background_color,
		//height: 95,
		child: new Row(
			mainAxisSize: MainAxisSize.max,
			mainAxisAlignment: MainAxisAlignment.spaceBetween,
			children: <Widget>[
				Expanded(
					child: Align(
						alignment: Alignment.bottomCenter,
						child: ElevatedButton(
							style: style_footer,
							onPressed: () {
								processPanicButton(context);
							},
							child: const Text('PANIC'),
							//icon: Icon(Icons.mic_rounded),
						),
					), //child: Align
				), //Expanded
			], //children: <Widget>
		), //new Row
	);
}

Widget getBottomAppBar([BuildContext? context])
{

	return BottomAppBar(
		color: footer_background_color,
		child: new Row(
			mainAxisSize: MainAxisSize.max,
			mainAxisAlignment: MainAxisAlignment.spaceBetween,
		), //new Row
	);
}
