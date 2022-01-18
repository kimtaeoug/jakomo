import 'package:shared_preferences/shared_preferences.dart';

class JakomoSP{
  static final JakomoSP jakomoSP = JakomoSP._init();
  JakomoSP._init();
  factory JakomoSP() => jakomoSP;
  late SharedPreferences _prefs;
  Future<void> initSharedPreference()async{
    _prefs = await SharedPreferences.getInstance();
  }
  void introductionSee(bool input)async{
    await _prefs.setBool('introSee', input);
  }
  bool getIntroSee()=>_prefs.getBool('introSee')!=null?_prefs.getBool('introSee')!:false;
}