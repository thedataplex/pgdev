import "dart:async";
import "package:flutter/material.dart";
import "package:torch_controller/torch_controller.dart";
import "package:geolocator/geolocator.dart";
import "actions.dart";

int mbcnt = 0;
//int lbcnt = 0;
//int fbcnt = 0;
int tsbcnt = 0;
int cbcnt = 0;
int sbcnt = 0;

void processMicButton(BuildContext context)
{
	mbcnt = mbcnt + 1;
	print("MicButton Pressed [$mbcnt] Times");
	//_showcontent(context);
}

void processTextSMSButton(BuildContext context)
{
	tsbcnt = tsbcnt + 1;
	print("TextSMSButton Pressed [$tsbcnt] Times");
	//_showcontent(context);
}

void processCallButton(BuildContext context)
{
	cbcnt = cbcnt + 1;
	print("CallButton Pressed [$cbcnt] Times");
	//_showcontent(context);
}
