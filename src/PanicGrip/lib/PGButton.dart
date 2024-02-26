import "dart:core";
import "dart:async";
import "dart:io";
import "dart:ui";
import "dart:isolate";
import 'package:flutter/services.dart';
import "package:flutter/material.dart";
import "package:geolocator/geolocator.dart";
import 'package:torch_light/torch_light.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:go_router/go_router.dart';

typedef buttonPressedFun = void Function(BuildContext);

Widget getElevatedButtonIcon(BuildContext context,
														buttonPressedFun argfun, 
														String arglabel, 
														ButtonStyle argstyle,
														IconData argicon)
{
	return ElevatedButton.icon(
		style:			argstyle,
		icon: 			Icon(argicon),
		label: 			Text(arglabel),
		onPressed:	() {
			argfun(context);
		},
	);
}

