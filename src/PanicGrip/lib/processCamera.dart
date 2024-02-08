import "dart:async";
import "dart:io";
import 'dart:typed_data';
import 'dart:ui' as ui;
import "package:flutter/material.dart";
import "package:torch_controller/torch_controller.dart";
import "package:geolocator/geolocator.dart";
import "actions.dart";
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:camera/camera.dart';
import 'package:image/image.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

int rcbcnt = 0;
int fcbcnt = 0;



void captureVideoFromFrontCamera() async
{
	await Permission.camera.request();
	await Permission.storage.request();
	await Permission.photos.request();
	WidgetsFlutterBinding.ensureInitialized();

	final cameras = await availableCameras();
	final camera = cameras.last;
	print(cameras.length);
	late CameraController controller;
	late Future<void> _initializeControllerFuture;

	controller = CameraController(camera, ResolutionPreset.medium);

	_initializeControllerFuture = controller.initialize();

	//await openAppSettings();

	try {
		await _initializeControllerFuture;

		final image = await controller!.takePicture();
		//print(image.path);
		ImageGallerySaver.saveFile(image.path.toString());
		controller.dispose();
	} catch (e) {
		print(e);
	}
	print("DP:Front Camera Image saved in Gallery");
}

void captureImageFromFrontCamera() async
{
	await Permission.storage.request();
	await Permission.photos.request();
	WidgetsFlutterBinding.ensureInitialized();

	final cameras = await availableCameras();
	final camera = cameras.last;
	print(cameras.length);
	late CameraController controller;
	late Future<void> _initializeControllerFuture;

	controller = CameraController(camera, ResolutionPreset.medium);

	_initializeControllerFuture = controller.initialize();

	//await openAppSettings();

	try {
		await _initializeControllerFuture;

		final image = await controller!.takePicture();
		//print(image.path);
		ImageGallerySaver.saveFile(image.path.toString());
		controller.dispose();
	} catch (e) {
		print(e);
	}
	print("DP:Front Camera Image saved in Gallery");
}

void captureVideoFromRearCamera() async
{

	await Permission.camera.request();
	await Permission.audio.request();
	await Permission.storage.request();
	await Permission.photos.request();
	WidgetsFlutterBinding.ensureInitialized();

	final cameras = await availableCameras();
	final camera = cameras.first;
	print(cameras.length);
	late CameraController controller;
	late Future<void> _initializeControllerFuture;

	controller = CameraController(camera, ResolutionPreset.medium);

	_initializeControllerFuture = controller.initialize();

	try {
		await _initializeControllerFuture;
		print("A");
		//await controller.prepareForVideoRecording();
		print("C");
		await controller.startVideoRecording();
		XFile? videoFile;

		sleep(Duration(seconds:60));
		controller.stopVideoRecording().then((XFile? file) 
		{
			if (file != null) {
        videoFile = file;
				print(videoFile?.path.toString());
				print("Coming inside");
				String? path = videoFile?.path.toString();
				ImageGallerySaver.saveFile(path.toString());
				sleep(Duration(seconds:10));
				controller.dispose();
				print("DP:Rear Camera Video saved in Gallery");
      }
		});

		//ImageGallerySaver.saveFile(videoFile!.path.toString());
	} on CameraException catch (e) {
		//_showCameraException(e);
		print("DPException");
		return;
	}
}

void captureImageFromRearCamera() async
{
	await Permission.storage.request();
	await Permission.photos.request();
	WidgetsFlutterBinding.ensureInitialized();

	final cameras = await availableCameras();
	final camera = cameras.first;
	print(cameras.length);
	late CameraController controller;
	late Future<void> _initializeControllerFuture;

	controller = CameraController(camera, ResolutionPreset.medium);

	_initializeControllerFuture = controller.initialize();

	//await openAppSettings();

	try {
		await _initializeControllerFuture;

		final image = await controller!.takePicture();
		//print(image.path);
		ImageGallerySaver.saveFile(image.path.toString());
		controller.dispose();
	} catch (e) {
		print(e);
	}
	print("DP:Rear Camera Image saved in Gallery");
}

void processFrontCameraButton() async
{
	fcbcnt = fcbcnt + 1;
	final permc = Permission.camera;
	captureImageFromFrontCamera();
	print("FrontCameraButton Pressed [$rcbcnt] Times");
}

void processRearCameraButton()
{
	rcbcnt = rcbcnt + 1;
	print("RearCameraButton Pressed [$rcbcnt] Times");
	print("Started Capturing Picture from Rear Camera");
	//captureImageFromRearCamera();
	//sleep(Duration(seconds:60));
	print("Started Capturing Video   from Rear Camera");
	captureVideoFromRearCamera();
}
