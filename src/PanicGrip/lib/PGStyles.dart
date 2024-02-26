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

//Color header_background_color = Colors.orangeAccent;
//Color footer_background_color = Colors.orangeAccent;
Color header_background_color = Colors.orange.shade400;
Color footer_background_color = Colors.orange.shade400;
	/*
	https://api.flutter.dev/flutter/material/Colors/orange-constant.html
	*/

final TextStyle header_text_style = const TextStyle(fontSize: 27.0, fontWeight: FontWeight.bold);

final ButtonStyle style_footer = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 40),
																//primary: Colors.deepOrangeAccent.shade700,
																backgroundColor: Colors.brown.shade900,
																foregroundColor: Colors.yellow
																);
final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 40),
																foregroundColor: Colors.deepOrangeAccent.shade700,
																backgroundColor: Colors.yellow
																);

final ButtonStyle style2 = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 9),
																//primary: Colors.black,
																backgroundColor: Colors.brown.shade900,
																foregroundColor: Colors.orangeAccent,
																);
