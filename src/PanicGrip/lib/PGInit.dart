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
import "PGBody.dart";
import "actions.dart";

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

int getdeviceType()
{
	if( Device.get().isPhone ){
		print("Phone Found");
		return 1;
	}
	if( Device.get().isTablet ){
		print("Tablet Found");
		return 2;
	}
	return -1;
}

int getPlatformType()
{
	if( Device.get().isAndroid ){
		print("Android Device Found");
		return 1;
	}
	if( Device.get().isIos ){
		print("Ios Device Found");
		return 2;
	}
	return -1;
}
