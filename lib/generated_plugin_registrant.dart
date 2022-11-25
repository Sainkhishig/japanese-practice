//
// Generated file. Do not edit.
//

// ignore_for_file: directives_ordering
// ignore_for_file: lines_longer_than_80_chars

import 'package:assets_audio_player_web/web/assets_audio_player_web.dart';
import 'package:audio_service_web/audio_service_web.dart';
import 'package:audio_session/audio_session_web.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:firebase_database_web/firebase_database_web.dart';
import 'package:firebase_storage_web/firebase_storage_web.dart';
import 'package:just_audio_web/just_audio_web.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  AssetsAudioPlayerWebPlugin.registerWith(registrar);
  AudioServiceWeb.registerWith(registrar);
  AudioSessionWeb.registerWith(registrar);
  FilePickerWeb.registerWith(registrar);
  FirebaseAuthWeb.registerWith(registrar);
  FirebaseCoreWeb.registerWith(registrar);
  FirebaseDatabaseWeb.registerWith(registrar);
  FirebaseStorageWeb.registerWith(registrar);
  JustAudioPlugin.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
