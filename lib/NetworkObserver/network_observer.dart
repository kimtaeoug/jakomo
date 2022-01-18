import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:jakomo_recliner/Logger/logger_factory.dart';

class NetworkObserver{
  static final NetworkObserver networkObserver = NetworkObserver._init();
  NetworkObserver._init();
  factory NetworkObserver() => networkObserver;

  final LoggerFactory _log = LoggerFactory();
  late Connectivity _connectivity;
  late ConnectivityResult _connectivityResult;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  late BuildContext _context;
  void setNetWorkObserverBuildContext(BuildContext context){
    _context = context;
  }
  void flyNetworkObserver(){
    _connectivityResult = ConnectivityResult.none;
    _connectivity = Connectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }
  Future<void> startNetworkObserving()async{
    late ConnectivityResult result;
    try{
      result = await _connectivity.checkConnectivity();
    }catch(e){
      _log.logE('$e');
      return;
    }
    return updateConnectionStatus(result);
  }
  void updateConnectionStatus(ConnectivityResult result)async{
    _connectivityResult = result;
  }
  void cancelNetworkObserving(){
    _connectivitySubscription.cancel();
  }
}