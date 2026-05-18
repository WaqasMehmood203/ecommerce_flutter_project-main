import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutterproject/common/widgets/loaders/loaders.dart';
import 'package:get/get.dart';

//Manages the network connectivity status and provides methods to check and handle connectivity changes.

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  //Initialize the network manager and set up a stream to continually check the connection status.

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_handleConnectivityChange);
  }

  // Handle connectivity changes.
  void _handleConnectivityChange(ConnectivityResult result) {
    _connectionStatus.value = result;
  }

  //update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
  Future<void> checkConnection(BuildContext context) async {
    if (_connectionStatus.value == ConnectivityResult.none) {
      ALoaders.customToast(message: "No Internet Connection");
    }
  }

  //check the internet connection status.
  //returns 'true' if connected, 'false' otherwise.
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  //dispose or close the active connectivity stream

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
