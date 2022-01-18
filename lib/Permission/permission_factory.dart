import 'package:jakomo_recliner/Logger/logger_factory.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionFactory{
  static final PermissionFactory permissionFactory = PermissionFactory._init();
  PermissionFactory._init();
  factory PermissionFactory() => permissionFactory;
  final LoggerFactory _log = LoggerFactory();
  final List<Permission> blePermission = [Permission.bluetooth, Permission.location];
  Future<bool> requestBLEPermission() async{
    try{
      Map<Permission, PermissionStatus> statuses = await blePermission.request();
      return checkIfDeny(statuses);
    }catch(e){
      _log.logE('$e in requestBLEPermission');
    }
    return false;
  }
  bool checkIfDeny(Map<Permission, PermissionStatus> input){
    for(Permission permission in input.keys){
      if(input[permission]!.isDenied){
        return false;
      }
    }
    return true;
  }
}