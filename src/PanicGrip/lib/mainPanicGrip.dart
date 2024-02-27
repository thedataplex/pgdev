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
import "PGInit.dart";
import "PGStyles.dart";
import "PGHeader.dart";
import "PGFooter.dart";
import "PGBody.dart";
import "actions.dart";
import "PGAlarm.dart";
import "PGFlashlight.dart";
import "PGLocation.dart";
import "PGCamera.dart";
import "PGSettings.dart";
import "PGTextToSpeech.dart";
import "PGPanic.dart";

const String dptitle = "DataPlex PanicGrip";

void main()
{

	initAll();
	getdeviceType();
	getPlatformType();
	runApp(DPPanicGripApp());
	//initPermissions();
	//print("After");
}

final GoRouter _router = GoRouter(
	routes: <RouteBase>[
		GoRoute(
			path: '/',
			builder: (BuildContext context, GoRouterState state) {
				//return const DPPanicGripHomeScreen();
				return DPPanicGripHomeScreen();
			},
			routes: <RouteBase>[

				GoRoute(
					path: 'alarm',
					onExit: (BuildContext context) {
						return ExitDPAlarmScreen(context);
					},
					builder: (BuildContext context, GoRouterState state) {
						return DPAlarmScreen();
					},
				),

				GoRoute(
					path: 'flashlight',
					onExit: (BuildContext context) {
						return ExitDPFlashlightScreen(context);
					},
					builder: (BuildContext context, GoRouterState state) {
						return DPFlashlightScreen();
					},
				),

				GoRoute(
					path: 'location',
					onExit: (BuildContext context) {
						return ExitDPLocationScreen(context);
					},
					builder: (BuildContext context, GoRouterState state) {
						return DPLocationScreen();
					},
				),

				GoRoute(
					path: 'text_sms',
					onExit: (BuildContext context) {
						return ExitDPTextSMSScreen(context);
					},
					builder: (BuildContext context, GoRouterState state) {
						return DPTextSMSScreen();
					},
				),

			],
		),
	],
);

class DPPanicGripApp extends StatelessWidget {
	const DPPanicGripApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

class DPPanicGripHomeScreen extends StatelessWidget 
{
	int currentPageIndex = 0;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			/////////////////////////////////////////////
			// Header
			/////////////////////////////////////////////
			appBar: getHeader(context),

			/////////////////////////////////////////////
			//Footer
			/////////////////////////////////////////////
			bottomNavigationBar: getFooter(context),

			/////////////////////////////////////////////
			//BODY
			/////////////////////////////////////////////
			body: getBody(context),
		); //home: Scaffold(
	}//Widget build
}

void _showcontent(BuildContext context) 
{
	showDialog(
		context: context, barrierDismissible: false, // user must tap button!

		builder: (BuildContext context) {
		return new AlertDialog(
		//title: new Text('You clicked on'),
		content: new SingleChildScrollView(
		child: new ListBody(
              children: [
                new Text('Click OK to Proceed'),
              ],
            ),
          ),
          actions: [
            new ElevatedButton(
              child: new Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
  );
}
