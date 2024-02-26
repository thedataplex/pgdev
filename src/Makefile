SRC_DIR = $(shell pwd)
APK_NAME = PanicGrip
OUTPUT_DIR = $(SRC_DIR)/../output

help:
	$(info make run     => To run PanicGrip App in release mode )
	$(info make debug   => To run PanicGrip App in debug mode)
	$(info make stt     => To run Speech to Text Independent App in debug mode)
	$(info make tts     => To run Text To Speech Independent App in debug mode)
	$(info make devices => flutter emulators - To show connected devices in flutter framework)
	$(info make doctor  => flutter doctor - To show the health of flutter)
run:
	$(eval APK_NAME := PanicGrip)
	ln -s -f $(SRC_DIR)/PanicGrip/lib/mainPanicGrip.dart $(SRC_DIR)/PanicGrip/lib/main.dart 
	@(\
		cd PanicGrip;\
		flutter pub run rename_app:main all=$(APK_NAME);\
		make release;\
	)
	cp $(SRC_DIR)/PanicGrip/build/app/outputs/flutter-apk/app-release.apk $(OUTPUT_DIR)/$(APK_NAME).apk

debug:
	ln -s -f PanicGrip/lib/main.dart PanicGrip/lib/mainPanicGrip.dart
	@(cd PanicGrip; make $@)

devices:
	@(cd PanicGrip; make $@)

doctor:
	@(cd PanicGrip; make $@)

studio:
	@(cd PanicGrip; make $@)

all:run

stt:
	$(eval APK_NAME := PGSpeechToText)
	ln -s -f $(SRC_DIR)/lab/speech_to_text.dart PanicGrip/lib/main.dart
	(\
		cd PanicGrip;\
		flutter pub add speech_to_text ;\
		flutter pub run rename_app:main all=$(APK_NAME);\
		make debug;\
	)
	cp $(SRC_DIR)/PanicGrip/build/app/outputs/flutter-apk/app-release.apk $(OUTPUT_DIR)/$(APK_NAME).apk

tts:
	$(eval APK_NAME := PGFlutterTTS)
	ln -s -f $(SRC_DIR)/lab/text_to_speech.dart PanicGrip/lib/main.dart
	(\
		cd PanicGrip;\
		flutter pub add flutter_tts ;\
		flutter pub run rename_app:main all=$(APK_NAME);\
		make debug;\
	)
	cp $(SRC_DIR)/PanicGrip/build/app/outputs/flutter-apk/app-release.apk $(OUTPUT_DIR)/$(APK_NAME).apk

call:
	$(eval APK_NAME := PGFPDCaller)
	ln -s -f $(SRC_DIR)/lab/call.dart PanicGrip/lib/main.dart
	(\
		cd PanicGrip;\
		flutter pub add flutter_phone_direct_caller ;\
		flutter pub run rename_app:main all=$(APK_NAME);\
		make debug;\
	)
	cp $(SRC_DIR)/PanicGrip/build/app/outputs/flutter-apk/app-release.apk $(OUTPUT_DIR)/$(APK_NAME).apk

camera:
	$(eval APK_NAME := PGCamera)
	ln -s -f $(SRC_DIR)/lab/camera.dart PanicGrip/lib/main.dart
	(\
		cd PanicGrip;\
		flutter pub add camera ;\
		flutter pub run rename_app:main all=$(APK_NAME);\
		make debug;\
	)
	cp $(SRC_DIR)/PanicGrip/build/app/outputs/flutter-apk/app-release.apk $(OUTPUT_DIR)/$(APK_NAME).apk

sms:
	$(eval APK_NAME := PGFlutterSMS)
	ln -s -f $(SRC_DIR)/lab/sms.dart PanicGrip/lib/main.dart
	(\
		cd PanicGrip;\
		flutter pub add flutter_sms ;\
		flutter pub run rename_app:main all=$(APK_NAME);\
		make debug;\
	)
	cp $(SRC_DIR)/PanicGrip/build/app/outputs/flutter-apk/app-release.apk $(OUTPUT_DIR)/$(APK_NAME).apk

sms2:
	$(eval APK_NAME := PGSMSAdvanced)
	ln -s -f $(SRC_DIR)/lab/sms.dart PanicGrip/lib/main.dart
	(\
		cd PanicGrip;\
		flutter pub add sms_advanced ;\
		flutter pub run rename_app:main all=$(APK_NAME);\
		make debug;\
	)
	cp $(SRC_DIR)/PanicGrip/build/app/outputs/flutter-apk/app-release.apk $(OUTPUT_DIR)/$(APK_NAME).apk

location:
	$(eval APK_NAME := PGLocation)
	ln -s -f $(SRC_DIR)/lab/location.dart PanicGrip/lib/main.dart
	(\
		cd PanicGrip;\
		flutter pub add location ;\
		flutter pub run rename_app:main all=$(APK_NAME);\
		make debug;\
	)
	cp $(SRC_DIR)/PanicGrip/build/app/outputs/flutter-apk/app-release.apk $(OUTPUT_DIR)/$(APK_NAME).apk

curloc:
	$(eval APK_NAME := PGCurrentLocation)
	ln -s -f $(SRC_DIR)/lab/curloc.dart PanicGrip/lib/main.dart
	(\
		cd PanicGrip;\
		flutter pub add current_location ;\
		flutter pub run rename_app:main all=$(APK_NAME);\
		make debug;\
	)
	cp $(SRC_DIR)/PanicGrip/build/app/outputs/flutter-apk/app-release.apk $(OUTPUT_DIR)/$(APK_NAME).apk

go_router:
	$(eval APK_NAME := PGGoRouter)
	ln -s -f $(SRC_DIR)/lab/go_router.dart PanicGrip/lib/main.dart
	(\
		cd PanicGrip;\
		flutter pub add go_router ;\
		flutter pub run rename_app:main all=$(APK_NAME);\
		make debug;\
	)
	cp $(SRC_DIR)/PanicGrip/build/app/outputs/flutter-apk/app-release.apk $(OUTPUT_DIR)/$(APK_NAME).apk

device_meta:
	$(eval APK_NAME := PGDeviceMeta)
	ln -s -f $(SRC_DIR)/lab/device_meta.dart PanicGrip/lib/main.dart
	(\
		cd PanicGrip;\
		flutter pub add device_meta ;\
		flutter pub run rename_app:main all=$(APK_NAME);\
		make debug;\
	)
	cp $(SRC_DIR)/PanicGrip/build/app/outputs/flutter-apk/app-release.apk $(OUTPUT_DIR)/$(APK_NAME).apk

background_location:
	$(eval APK_NAME := PGBackgroundLocation)
	ln -s -f $(SRC_DIR)/lab/background_location.dart PanicGrip/lib/main.dart
	(\
		cd PanicGrip;\
		flutter pub add background_location ;\
		flutter pub run rename_app:main all=$(APK_NAME);\
		make debug;\
	)
	cp $(SRC_DIR)/PanicGrip/build/app/outputs/flutter-apk/app-release.apk $(OUTPUT_DIR)/$(APK_NAME).apk

internet_connection_checker:
	$(eval APK_NAME := PGInternetConnection)
	ln -s -f $(SRC_DIR)/lab/internet_connection_checker.dart PanicGrip/lib/main.dart
	(\
		cd PanicGrip;\
		flutter pub add internet_connection_checker ;\
		flutter pub run rename_app:main all=$(APK_NAME);\
		make debug;\
	)
	cp $(SRC_DIR)/PanicGrip/build/app/outputs/flutter-apk/app-release.apk $(OUTPUT_DIR)/$(APK_NAME).apk


r:run
d:devices
doc:doctor
s:studio

gp:
	git pull
