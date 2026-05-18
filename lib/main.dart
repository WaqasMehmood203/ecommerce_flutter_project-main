import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutterproject/app.dart';
import 'package:flutterproject/common/widgets/loaders/loaders.dart';
import 'package:flutterproject/data/repositories/authentication/authentication_repository.dart';
import 'package:flutterproject/firebase_options.dart';
import 'package:flutterproject/utils/firestore_uploader.dart';
import 'package:flutterproject/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

//entry point of flutter app

Future<void> main() async {
  // Add widgets binding
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // GetX Local Storage
  await GetStorage.init().then((_) {}).catchError((e) {
    ALoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  });

  // Initialize ALocalStorage ✅ CRITICAL FIX
  try {
    await ALocalStorage.init('flutterproject');
    if (kDebugMode) {
      print('✅ ALocalStorage initialized successfully');
    }
  } catch (e) {
    if (kDebugMode) {
      print('❌ ALocalStorage initialization failed: $e');
    }
  }

  // Await Native Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase — MUST happen before any Firebase usage
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  try {
    final seeded = await FirestoreUploader.seedIfEmpty();
    if (kDebugMode && seeded) {
      debugPrint('Sample data seeded into Firestore.');
    }
  } catch (e) {
    if (kDebugMode) {
      debugPrint('Sample data seeding skipped/failed: $e');
    }
  }

  if (kDebugMode) {
    print("Firebase initialized");
  }

  // Initialize authentication repository
  Get.put(
    AuthenticationRepository(),
  );
  if (kDebugMode) {
    print("Auth repo registered");
  }

  runApp(const App());
}
