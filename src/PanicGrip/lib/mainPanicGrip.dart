import "dart:async";
import "dart:isolate";
import "package:flutter/material.dart";
import "package:geolocator/geolocator.dart";
import "package:geolocator/geolocator.dart";
import "package:flutter_device_type/flutter_device_type.dart";
import 'package:torch_light/torch_light.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

//Local Files
import "actions.dart";
import "processAlarm.dart";
import "processFlashlight.dart";
import "processLocation.dart";
import "processCamera.dart";
import "processSettings.dart";
import "processTextToSpeech.dart";
import "processPanic.dart";

const String dptitle = "DataPlex PanicGrip";

void initPermissions() async
{
	print("h4");
}

void initFlashlight()
{
		//TorchController().initialize();
}

void initLocation()
{

}

void initCamera() async
{
	// Ensure that plugin services are initialized so that `availableCameras()`
	// can be called before `runApp()`
	//WidgetsFlutterBinding.ensureInitialized();

	// Obtain a list of the available cameras on the device.
	//final cameras = await availableCameras();

	// Get a specific camera from the list of available cameras.
	//final firstCamera = cameras.first;
}

void initAll()
{
	initFlashlight();
	initLocation();
	initCamera();
}

void deviceType()
{
	if( Device.get().isAndroid ){
		print("Android Device Found");
	}
	if( Device.get().isIos ){
		print("Ios Device Found");
	}

	if( Device.get().isPhone ){
		print("Phone Found");
	}
	if( Device.get().isTablet ){
		print("Tablet Found");
	}
}

void main()
{

	initAll();
	deviceType();
	runApp(DPPanicGripApp());
	//initPermissions();
	//print("After");
}

class DPPanicGripApp extends StatelessWidget 
{
	int currentPageIndex = 0;

	final TextStyle header_text_style = const TextStyle(fontSize: 27.0, fontWeight: FontWeight.bold);
	//Color header_background_color = Colors.orangeAccent;
	//Color footer_background_color = Colors.orangeAccent;
	Color header_background_color = Colors.orange.shade400;
	Color footer_background_color = Colors.orange.shade400;
	/*
	https://api.flutter.dev/flutter/material/Colors/orange-constant.html
	*/


	final ButtonStyle style_footer =
	ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 40),
																//primary: Colors.deepOrangeAccent.shade700,
																backgroundColor: Colors.brown.shade900,
																foregroundColor: Colors.yellow
																);
	final ButtonStyle style =
	ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 40),
																foregroundColor: Colors.deepOrangeAccent.shade700,
																backgroundColor: Colors.yellow
																);

	final ButtonStyle style2 =
	ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 9),
																//primary: Colors.black,
																backgroundColor: Colors.brown.shade900,
																foregroundColor: Colors.orangeAccent,
																);

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(

			/********************************************
			Header
			********************************************/
			appBar: AppBar(
				title: new Text('Panic Grip',style: header_text_style,),
				toolbarHeight: 80,
				centerTitle: true,
				backgroundColor: header_background_color,
				bottom: PreferredSize(
					preferredSize: const Size.fromHeight(4.0),
					child: Container(
						//color: Colors.blue,
						color: Colors.brown.shade900,
						height: 4.0,
					),
				)
			),

			/////////////////////////////////////////////
			//Footer
			/////////////////////////////////////////////
			bottomNavigationBar: BottomAppBar(
				color: footer_background_color,
				height: 95,
				child: new Row(
					mainAxisSize: MainAxisSize.max,
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
					children: <Widget>[
						Expanded(
							child: Align(
								alignment: Alignment.bottomCenter,
								child: ElevatedButton(
									style: style_footer,
									onPressed: () {processPanicButton();},
									child: const Text('PANIC'),
									//icon: Icon(Icons.mic_rounded),
								),
							), //child: Align
						), //Expanded
					], //children: <Widget>
				), //new Row
			), //BottomAppBar

			/////////////////////////////////////////////
			//BODY
			/////////////////////////////////////////////

			body: Container(
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
								onPressed: () {processAlarmButton();},
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
								onPressed: () {processFlashlightButton();},
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
								onPressed: () {processLocationButton();},
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
							onPressed: () {processFlashlightButton();},
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
		), //body: Container
	), //home: Scaffold(
	);//MaterialApp
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
