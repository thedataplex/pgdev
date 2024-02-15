SRC_DIR = $(shell pwd)

help:
	$(info make run     => To run PanicGrip App in release mode )
	$(info make debug   => To run PanicGrip App in debug mode)
	$(info make stt     => To run Speech to Text Independent App in debug mode)
	$(info make tts     => To run Text To Speech Independent App in debug mode)
	$(info make devices => flutter emulators - To show connected devices in flutter framework)
	$(info make doctor  => flutter doctor - To show the health of flutter)
run:
	ln -s -f $(SRC_DIR)/PanicGrip/lib/mainPanicGrip.dart $(SRC_DIR)/PanicGrip/lib/main.dart 
	@(cd PanicGrip; make $@)

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
	ln -s -f $(SRC_DIR)/lab/speech_to_text.dart PanicGrip/lib/main.dart
	@(cd PanicGrip; flutter pub add speech_to_text; make $@)

tts:
	ln -s -f $(SRC_DIR)/lab/text_to_speech.dart PanicGrip/lib/main.dart
	@(cd PanicGrip; flutter pub add flutter_tts ; make $@)

call:
	ln -s -f $(SRC_DIR)/lab/call.dart PanicGrip/lib/main.dart
	@(cd PanicGrip; flutter pub add flutter_phone_direct_caller ; make $@)


r:run
d:devices
doc:doctor
s:studio
