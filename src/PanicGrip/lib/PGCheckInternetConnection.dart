import "dart:async";
import "dart:core";
import 'dart:io';
import "package:flutter/material.dart";
import "actions.dart";
import 'package:current_location/current_location.dart';
import 'package:current_location/model/location.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


bool statusInternet = false;

Future<bool> execute(
  InternetConnectionChecker internetConnectionChecker,
) async {
  // Simple check to see if we have Internet
  // ignore: avoid_print
  print('''The statement 'this machine is connected to the Internet' is: ''');
  final bool isConnected = await InternetConnectionChecker().hasConnection;
  // ignore: avoid_print
  print(
    isConnected.toString(),
  );
  // returns a bool

  // We can also get an enum instead of a bool
  // ignore: avoid_print
  print(
    'Current status: ${await InternetConnectionChecker().connectionStatus}',
  );
  // Prints either InternetConnectionStatus.connected
  // or InternetConnectionStatus.disconnected

  // actively listen for status updates
  final StreamSubscription<InternetConnectionStatus> listener =
      InternetConnectionChecker().onStatusChange.listen(
    (InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          // ignore: avoid_print
          print('Data connection is available.');
          statusInternet = true;
					break;
        case InternetConnectionStatus.disconnected:
          // ignore: avoid_print
          print('You are disconnected from the internet.');
          statusInternet = false;
					break;
      }
    },
  );

  // close listener after 30 seconds, so the program doesn't run forever
  //await Future<void>.delayed(const Duration(seconds: 30));
  //await Future<void>.delayed(const Duration(seconds: 1));
  await Future<void>.delayed(const Duration(milliseconds: 250));
  await listener.cancel();
	return true;
}
