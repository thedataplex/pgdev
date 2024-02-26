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

PreferredSizeWidget getHeader(BuildContext context)
{
	return AppBar(
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
	);
}

PreferredSizeWidget getAppBar(String titlestr)
{
	return AppBar(
		title: new Text(titlestr, style: header_text_style,),
		centerTitle: true,
		backgroundColor: header_background_color,
	);
}
