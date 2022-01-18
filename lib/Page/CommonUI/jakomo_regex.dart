import 'package:email_validator/email_validator.dart';

class JakomoRegex{
  final RegExp phoneRegex = RegExp(r'(^(?:[+0]9)?[0-9]{11}$)');
  final RegExp numberRegex = RegExp(r'(\d+)');
  final RegExp englishRegex = RegExp(r'[a-zA-Z]');
  final RegExp specialRegex = RegExp(r'^[a-zA-Z0-9 ]+$');
  bool isEmail(String input) => EmailValidator.validate(input);
  bool hasNumber(String input) =>numberRegex.hasMatch(input);
  bool hasEnglish(String input) => englishRegex.hasMatch(input);
  bool hasSpecial(String input) => specialRegex.hasMatch(input);
  bool isPwd(String input) {
    bool number = false;
    bool english = false;
    bool special = false;
    bool length = false;
    if(hasNumber(input)){
      number = true;
    }
    if(hasEnglish(input)){
      english = true;
    }
    if(!hasSpecial(input)){
      special = true;
    }
    if(input.length >7 && input.length<17){
      length = true;
    }
    if(number == true && english == true && special == true && length == true){
      return true;
    }else{
      return false;
    }
  }
  bool isPhone(String input) => phoneRegex.hasMatch(input);
}