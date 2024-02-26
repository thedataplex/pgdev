import "dart:async";
import "dart:core";
import 'dart:io';
import "package:flutter/material.dart";
import 'package:current_location/current_location.dart';
import 'package:current_location/model/location.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

//Local files
import "actions.dart";
import "PGStyles.dart";
import "PGInit.dart";
import "PGHeader.dart";
import "PGFooter.dart";
import "PGCheckInternetConnection.dart";

int lbcnt = 0;
bool statusInternet = false;

Widget getNoInternetWidget()
{
	var now = DateTime.now();
	var day = now.day.toString();
	var month = now.month.toString();
	var year = now.year.toString();
	var timezone = now.timeZoneName;

	var hour = now.hour.toString();
	var minute = now.minute.toString();
	var seconds = now.second.toString();
	String connstr = "Disconnected i.e. No Internet";
	return Center(
		child: Column(
			mainAxisAlignment: MainAxisAlignment.center,
			crossAxisAlignment: CrossAxisAlignment.center,
			children: [
				Text('Date: ' + day + '/' + month + '/' + year),
				Text('Time: ' + hour + ':'+ minute + ':' + seconds + ' ' + timezone),
				Text('Internet: ' + connstr),
			],
		),
	);
}

class DPLocationScreen extends StatefulWidget {
  DPLocationScreen({Key? key}) : super(key: key);
  @override
  State<DPLocationScreen> createState() => _DPLocationScreenState();
}

class _DPLocationScreenState extends State<DPLocationScreen> {

  @override
  Widget build(BuildContext context) {

		//await execute(InternetConnectionChecker());
		String titlestr = "Location Details";


		if (statusInternet == true) {
			var now = DateTime.now();
			var day = now.day.toString();
			var month = now.month.toString();
			var year = now.year.toString();
			var timezone = now.timeZoneName;

			var hour = now.hour.toString();
			var minute = now.minute.toString();
			var seconds = now.second.toString();
			String connstr;

			print("Mobile is connected to Internet");
			connstr = "Connected";
			return Scaffold(
				appBar: getAppBar( titlestr),
				//bottomNavigationBar: getBottomAppBar(context),
				bottomNavigationBar: getBottomNavigationBar(context),
				body: FutureBuilder(
					future: UserLocation.getValue(),
					builder: (BuildContext context, dynamic snapshot) {
					if (snapshot.hasData) {
						return Center(
							child: Column(
								mainAxisAlignment: MainAxisAlignment.center,
								crossAxisAlignment: CrossAxisAlignment.center,
								children: [
									Text('Date: ' + day + '/' + month + '/' + year),
									Text('Time: ' + hour + ':'+ minute + ':' + seconds + ' ' + timezone),
									Text('Country: ${snapshot.data!.country}'),
									Text('Country Code: ${snapshot.data!.countryCode}'),
									Text('Region: ${snapshot.data!.region}'),
									Text('Region Name: ${snapshot.data!.regionName}'),
									Text('Timezone: ${snapshot.data!.timezone}'),
									Text('Latitude: ${snapshot.data!.latitude}'),
									Text('Longitude: ${snapshot.data!.longitude}'),
									Text('ISP: ${snapshot.data!.isp}'),
									Text('Current IP: ${snapshot.data!.currentIP}'),
									Text('Internet: ' + connstr),
								],
							),
						);
					}
					return const CircularProgressIndicator();
				},
			),
		); //return Scaffold
		} else {
			print("Mobile is NOT connected to Internet");
    	return Scaffold(
				appBar: getAppBar( titlestr),
				body: getNoInternetWidget(),
				//bottomNavigationBar: getBottomAppBar(context),
				bottomNavigationBar: getBottomNavigationBar(context),
			);
		}
  }
}

FutureOr<bool> ExitDPLocationScreen(BuildContext context)    
{    
  print("Exit: Location Screen");    
  return true;    
}    

void processLocationButton(BuildContext context) async
{
	statusInternet = await execute(InternetConnectionChecker());
	lbcnt = lbcnt + 1;
	print("LocationButton Pressed [$lbcnt] Times");
	context.go('/location');
}
