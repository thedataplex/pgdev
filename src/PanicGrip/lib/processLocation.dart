import "dart:async";
import "package:flutter/material.dart";
import "package:torch_controller/torch_controller.dart";
import "package:geolocator/geolocator.dart";
import "actions.dart";

int lbcnt = 0;
//int fbcnt = 0;
 bool servicestatus = false;
 bool haspermission = false;
 late LocationPermission permission;
 late Position position;
 String long = "", lat = "";
 late StreamSubscription<Position> positionStream;

void processLocationButton() async
{
	lbcnt = lbcnt + 1;
	//print("LocationButton Pressed [$lbcnt] Times");
	checkGps();
}

void checkGps() async {
	servicestatus = await Geolocator.isLocationServiceEnabled();
	if(servicestatus){
		permission = await Geolocator.checkPermission();

		if (permission == LocationPermission.denied) {
			permission = await Geolocator.requestPermission();
			if (permission == LocationPermission.denied) {
				print('Location permissions are denied');
			} else if(permission == LocationPermission.deniedForever){
				print("'Location permissions are permanently denied");
			} else {
				haspermission = true;
			}
		} else{
			haspermission = true;
			getLocation();
		}

		/*
		if(haspermission){
			getLocation();
  	}
		*/
  }else{
		print("GPS Service is not enabled, turn on GPS location");
	}
}

void  getLocation() async {
	position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
	//print(position.longitude); //Output: 80.24599079
	//print(position.latitude); //Output: 29.6593457

	print("here1");
	long = position.longitude.toString();
	lat = position.latitude.toString();

	LocationSettings locationSettings = LocationSettings(
		accuracy: LocationAccuracy.high, //accuracy of the location data
		distanceFilter: 100, //minimum distance (measured in meters) a 
                         //device must move horizontally before an update event is generated;
	);

	print("here2");
	StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
		locationSettings: locationSettings).listen((Position position) {
		print("DP Panic Grip Longitude: $position.longitude"); //Output: 80.24599079
		print("DP Panic Grip Latitude : $position.latitude"); //Output: 29.6593457

		long = position.longitude.toString();
		lat = position.latitude.toString();
		}
	);
	print("here3");
} 
