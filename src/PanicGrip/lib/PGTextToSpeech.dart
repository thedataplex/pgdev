import "dart:core";
import "dart:async";
import "dart:io";
import "dart:ui";
import "dart:isolate";
import "dart:async";
import "actions.dart";
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:alarmplayer/alarmplayer.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
//import 'tts.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_sms/flutter_sms.dart';

//Local files
import "actions.dart";
import "PGStyles.dart";
import "PGInit.dart";
import "PGHeader.dart";
import "PGFooter.dart";
import "PGCheckInternetConnection.dart";

int tscnt = 0;

String smsText = "Hi This is Panic Grip App";
TextEditingController _controller = new TextEditingController();

int? _inputLength;
enum TtsState { playing, stopped, paused, continued }

//Future<void> _sendSMS(List<String> recipients) async 
Future<void> _sendSMS() async 
{
	bool _sendDirect = true;
	String _message = "This is a test message!";
	List<String> _recipients = ["9552590411", "8208684984"];
	try {
		String _result = await sendSMS(
			//message: _controllerMessage.text,
			message: _message,
			recipients: _recipients,
			sendDirect: _sendDirect,
		);
      //setState(() => _message = _result);
	} catch (error) {
      //setState(() => _message = error.toString());
	}
}

FutureOr<bool> ExitDPTextSMSScreen(BuildContext context)
{    
	print("Exit: Text/SMS Screen");       
	return true;
}

void processTextToSpeech(BuildContext context) async
{
	//runApp(DPTextSMSScreen());
	tscnt = tscnt + 1;

	print("Text/SMS Pressed [$tscnt] Times");
	FlutterTts flutterTts = FlutterTts();
	_controller.text = smsText;
	context.go('/text_sms');
	/*
	Future<dynamic> _getLanguages() async => await flutterTts.getLanguages;
  Future<dynamic> _getEngines() async => await flutterTts.getEngines;

	_getDefaultEngine(flutterTts);
  _getDefaultVoice(flutterTts);
	*/
}

class DPTextSMSScreen extends StatefulWidget {
	DPTextSMSScreen({Key? key}) : super(key: key);
	@override
	State<DPTextSMSScreen> createState() => _DPTextSMSScreenState();
}


class _DPTextSMSScreenState extends State<DPTextSMSScreen> {

	late FlutterTts flutterTts;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  bool isCurrentLanguageInstalled = false;

  int? _inputLength;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWindows => !kIsWeb && Platform.isWindows;
  bool get isWeb => kIsWeb;

  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();

    _setAwaitOptions();

    if (isAndroid) {
      _getDefaultEngine();
      _getDefaultVoice();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    if (isAndroid) {
      flutterTts.setInitHandler(() {
        setState(() {
          print("TTS Initialized");
        });
      });
    }

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setPauseHandler(() {
      setState(() {
        print("Paused");
        ttsState = TtsState.paused;
      });
    });

    flutterTts.setContinueHandler(() {
      setState(() {
        print("Continued");
        ttsState = TtsState.continued;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

  Future<dynamic> _getLanguages() async => await flutterTts.getLanguages;

  Future<dynamic> _getEngines() async => await flutterTts.getEngines;

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  Future _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {
      print(voice);
    }
  }

  Future _speak() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    if (smsText != null) {
      if (smsText!.isNotEmpty) {
				print(smsText);
        await flutterTts.speak(smsText!);
      }
    }
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  Future _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

  Future _sms() async {
    //var result = await flutterTts.pause();
		print("Sending SMS");
    //if (result == 1) setState(() => ttsState = TtsState.paused);
		_sendSMS();
  }
  Future _share() async {
    //var result = await flutterTts.pause();
		print("Sending WA");
    //if (result == 1) setState(() => ttsState = TtsState.paused);
		//_sendSMS();
  }

  Future _email() async {
    //var result = await flutterTts.pause();
		print("Sending Email");
    //if (result == 1) setState(() => ttsState = TtsState.paused);
		//_sendSMS();
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  void _onChange(String text) {
    setState(() {
      smsText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
		String titlestr = "Text/SMS";
    return MaterialApp(
      home: Scaffold(
        appBar: getAppBar(titlestr),
				bottomNavigationBar: getBottomNavigationBar(context),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              getInputSection(),
              _btnSection(),
              //_engineSection(),
            ],
          ),
        ),
      ),
    );
  }

	Widget getInputSection() => Container(
		alignment: Alignment.topCenter,
		//padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
		child: TextField(
			decoration: InputDecoration (
				enabledBorder: OutlineInputBorder (
					borderSide: BorderSide (
						width: 3,
						color: Colors.greenAccent,
					),
				),
			),
			controller: _controller,
			maxLines: 11,
			minLines: 6,
			onChanged: (String value) {
				_onChange(value);
			},
		)
	);

	Widget getInputSection2() => Row(
		//padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
		mainAxisSize: MainAxisSize.max,
		mainAxisAlignment: MainAxisAlignment.spaceBetween,
		children: <Widget>[
			Expanded (
				child: Align(
					alignment: Alignment.topCenter,
					child: TextField(
						decoration: InputDecoration (
							enabledBorder: OutlineInputBorder (
								borderSide: BorderSide (
									width: 3,
									color: Colors.blueAccent,
								),
							),
						),
						controller: _controller,
						maxLines: 3,
						minLines: 2,
						onChanged: (String value) {
							_onChange(value);
						},
					),
				),
			), //Expanded

			Expanded (
				child: Align(
					alignment: Alignment.topCenter,
					child: TextField(
						decoration: InputDecoration (
							enabledBorder: OutlineInputBorder (
								borderSide: BorderSide (
									width: 3,
									color: Colors.greenAccent,
								),
							),
						),
						controller: _controller,
						maxLines: 11,
						minLines: 6,
						onChanged: (String value) {
							_onChange(value);
						},
					),
				),
			), //Expanded

		],
	);


	Widget getInputSection3() => Column(
		//padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
		mainAxisSize: MainAxisSize.max,
		mainAxisAlignment: MainAxisAlignment.spaceBetween,
		children: <Widget>[
			Expanded (
				child: Align(
					//alignment: Alignment.topCenter,
					child: TextField(
						decoration: InputDecoration (
							enabledBorder: OutlineInputBorder (
								borderSide: BorderSide (
									width: 3,
									color: Colors.blueAccent,
								),
							),
						),
						controller: _controller,
						maxLines: 3,
						minLines: 2,
						onChanged: (String value) {
							_onChange(value);
						},
					),
				),
			), //Expanded

			Expanded (
				child: Align(
					//alignment: Alignment.topCenter,
					child: TextField(
						decoration: InputDecoration (
							enabledBorder: OutlineInputBorder (
								borderSide: BorderSide (
									width: 3,
									color: Colors.greenAccent,
								),
							),
						),
						controller: _controller,
						maxLines: 11,
						minLines: 6,
						onChanged: (String value) {
							_onChange(value);
						},
					),
				),
			), //Expanded

		],
	);

	/*
					child: TextField(
						decoration: InputDecoration (
							enabledBorder: OutlineInputBorder (
								borderSide: BorderSide (
									width: 3,
									color: Colors.greenAccent,
								),
							),
						),
						controller: _controller,
						maxLines: 11,
						minLines: 6,
						onChanged: (String value) {
							_onChange(value);
						},
					)
	*/

  Widget _btnSection() {
    return Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.green, Colors.greenAccent, Icons.play_arrow,
              'PLAY', _speak),
          _buildButtonColumn(
              Colors.red, Colors.redAccent, Icons.stop, 'STOP', _stop),
					/*
          _buildButtonColumn(
              Colors.blue, Colors.blueAccent, Icons.pause, 'PAUSE', _pause),
					*/
          _buildButtonColumn(
              Colors.blue, Colors.blueAccent, Icons.sms, 'Text', _sms),
          _buildButtonColumn(
              Colors.indigo, Colors.indigoAccent, Icons.share, 'Whatsapp', _share),
          _buildButtonColumn(
              Colors.purple, Colors.purpleAccent, Icons.email, 'Email', _email),
        ],
      ),
    );
  }

  Column _buildButtonColumn(Color color, Color splashColor, IconData icon,
      String label, Function func) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(icon),
              color: color,
              splashColor: splashColor,
              onPressed: () => func()),
          Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: color)))
        ]);
  }
}
