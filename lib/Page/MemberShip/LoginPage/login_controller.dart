import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  int boulder = 0xff757575;
  int normalColor = 0xffebebeb;
  int rightColor = 0xff0091ea;
  int errorColor = 0xffd32f2f;

  RxBool auto = false.obs;

  RxString id = ''.obs;
  RxString idError = ''.obs;
  RxInt idColor = 0xffebebeb.obs;
  RxInt idLabelColor = 0xff757575.obs;

  RxString pwd = ''.obs;
  RxString pwdError = ''.obs;
  RxInt pwdColor = 0xffebebeb.obs;

  GlobalKey<FormState>? idKey = null;
  void setIdKey(GlobalKey<FormState> input){
    idKey = input;
    update();
  }
  GlobalKey<FormState>? pwdKey = null;
  void setPwdKey(GlobalKey<FormState> input){
    pwdKey = input;
    update();
  }

  bool isEmail(String input) => EmailValidator.validate(input);
  void emailLiveRestriction(String? value){
    if(value != null && value != ''){
      if(isEmail(value)){
        idError.value = '';
        idColor.value = normalColor;
        idLabelColor.value = normalColor;
      }else{
        idError.value = '이메일 형식에 맞지 않습니다';
        idColor.value = errorColor;
        idLabelColor.value = errorColor;
      }
    }else{
      idError.value = '이메일을 입력해주세요.';
      idColor.value = errorColor;
      idLabelColor.value = errorColor;
    }
  }

  void emailSucceed(String? value){
    if(value != null ){
      if(idError.value == ''){
        id.value = value;
      }
    }
  }
  void pwdLiveRestriction(String? value){
    if(value == null || value == ''){
      pwdError.value = '비밀번호를 입력해주세요.';
      pwdColor.value = errorColor;
    }else{
      pwdError.value = '';
      pwdColor.value = normalColor;
    }
  }
  void pwdSucceed(String? value){
    if(value != null && value != ''){
      pwd.value = value;
      pwdColor.value = normalColor;
    }else{
      pwdError.value = '비밀번호를 입력해주세요.';
      pwdColor.value = errorColor;
    }
  }
  void loginProcess(){
    if(idKey != null && pwdKey != null){
      if(idError.value != '' && pwdError.value != ''){
        idKey!.currentState!.save();
        pwdKey!.currentState!.save();
      }
    }else{
      //error process
    }
  }
}