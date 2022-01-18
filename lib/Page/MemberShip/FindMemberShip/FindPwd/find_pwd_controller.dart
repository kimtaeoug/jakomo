import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_regex.dart';

class FindPwdController extends GetxController{
  final JakomoRegex jakomoRegex = JakomoRegex();
  final int rightColor = 0xff0091ea;
  final int errorColor = 0xffd32f2f;
  final int gallery = 0xffebebeb;
  final int boulder = 0xff757575;

  RxString id = ''.obs;
  RxInt idColor = 0xffebebeb.obs;
  RxInt idLabelColor = 0xff757575.obs;
  RxString errorId = ''.obs;
  RxBool didInsertEmail = false.obs;
  void validateEmail(String? value){
    if(value != null && value != ''){
      if(jakomoRegex.isEmail(value)){
        errorId.value = '';
        idColor.value = rightColor;
        idLabelColor.value = rightColor;
        didInsertEmail.value = true;
      }else{
        errorId.value = '영문과 숫자를 조합하여 입력해주세요.';
        idColor.value = errorColor;
        idLabelColor.value = errorColor;
        didInsertEmail.value = false;
      }
    }else{
      errorId.value = '아메일을 입력해주세요.';
      idColor.value = errorColor;
      idLabelColor.value = errorColor;
      didInsertEmail.value = false;
    }
  }

  RxString pwd = ''.obs;
  RxString errorPwd = ''.obs;
  RxInt pwdColor = 0xffebebeb.obs;
  RxInt pwdLabelColor = 0xff757575.obs;
  void validatePwd(String? value){
    if(value != null && value != ''){
      if(jakomoRegex.isPwd(value)){
        errorPwd.value = '';
        pwdColor.value = rightColor;
        pwdLabelColor.value = rightColor;
        pwd.value = value;
      }else{
        errorPwd.value = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.';
        pwdColor.value = errorColor;
        pwdLabelColor.value = errorColor;
      }
    }else{
      errorPwd.value = '비밀번호를 입력해 주세요.';
      pwdColor.value = errorColor;
      pwdLabelColor.value = errorColor;
    }
  }


  RxString checkPwd = ''.obs;
  RxString errorCheckPwd = ''.obs;
  RxInt checkPwdColor = 0xffebebeb.obs;
  RxInt checkPwdLabelColor = 0xff757575.obs;
  RxBool nowRequestModify = false.obs;
  void validateCheckPwd(String? value){
    if(value != null && value != ''){
      checkPwd.value = value;
      if(checkPwd.value == pwd.value){
        errorCheckPwd.value = '';
        checkPwdColor.value = rightColor;
        checkPwdLabelColor.value = rightColor;
        nowRequestModify.value = true;
      }else{
        errorCheckPwd.value = '비밀번호가 일치하지 않습니다.';
        checkPwdColor.value = errorColor;
        checkPwdLabelColor.value = errorColor;
        nowRequestModify.value = false;
      }
    }else{
      errorCheckPwd.value = '비밀번호가 일치하지 않습니다.';
      checkPwdColor.value = errorColor;
      checkPwdLabelColor.value = errorColor;
      nowRequestModify.value = false;
    }
  }

  RxBool requestAuth = false.obs;
  RxString phone = ''.obs;
  RxString errorPhone = ''.obs;
  RxInt phoneColor = 0xffebebeb.obs;
  RxInt phoneLabelColor = 0xff757575.obs;
  RxBool canAuth = false.obs;
  void validatePhone(String? value){
    if(value != null && value != ''){
      if(jakomoRegex.isPhone(value)){
        errorPhone.value = '';
        phoneColor.value = rightColor;
        phoneLabelColor.value = rightColor;
        canAuth.value = true;
      }else{
        errorPhone.value = '잘못된 전화번호 형식입니다.';
        phoneColor.value = errorColor;
        phoneLabelColor.value = errorColor;
        canAuth.value = false;
      }
    }else{
      errorPhone.value = '잘못된 전화번호 형식입니다.';
      phoneColor.value = errorColor;
      phoneLabelColor.value = errorColor;
      canAuth.value = false;
    }
  }

  void errorAuthPhoneButton(){
    errorPhone.value = '잘못된 전화번호 형식입니다.';
    phoneColor.value = errorColor;
    phoneLabelColor.value = errorColor;
    canAuth.value = false;
  }

  RxString authPhone = ''.obs;
  RxString errorAuthPhone = ''.obs;
  RxInt authPhoneColor = 0xffebebeb.obs;
  RxInt authPhoneLabelColor = 0xff757575.obs;
  RxBool didPhoneAuth = false.obs;
  void validateAuthPhone(String? value){
    if(value != null && value != ''){
      if(value == '1234'){
        errorAuthPhone.value = '';
        authPhoneColor.value = rightColor;
        authPhoneLabelColor.value = rightColor;
        didPhoneAuth.value = true;
      }else{
        errorAuthPhone.value = '인증번호가 일치하지 않습니다.';
        authPhoneColor.value = errorColor;
        authPhoneLabelColor.value = errorColor;
        didPhoneAuth.value = false;
      }
    }else{
      errorAuthPhone.value = '인증번호를 입력해주세요.';
      authPhoneColor.value = errorColor;
      authPhoneLabelColor.value = errorColor;
      didPhoneAuth.value = false;
    }
  }

  RxString name = ''.obs;
  RxInt nameColor = 0xffebebeb.obs;
  RxInt nameLabelColor = 0xff757575.obs;
  RxString nameError = ''.obs;
  RxBool didInsertName = false.obs;
  void validateName(String? value){
    if(value != null && value != ''){
      nameError.value = '';
      nameColor.value = rightColor;
      nameLabelColor.value = rightColor;
      name.value = value;
      didInsertName.value = true;
    }else{
      nameError.value = '이름을 입력해주세요.';
      nameColor.value = errorColor;
      nameLabelColor.value = errorColor;
      didInsertName.value = false;
    }
  }
  RxBool requestModifyResult = false.obs;

  void overFlowTime(){
    errorAuthPhone.value = '인증번호 발송을 다시 요청해 주세요.';
    authPhoneColor.value = errorColor;
    authPhoneLabelColor.value = errorColor;
    didPhoneAuth.value = false;
  }
  void resetAuthPhone(){
    errorAuthPhone.value = '';
    authPhoneColor.value = gallery;
    authPhoneLabelColor.value = boulder;
    didPhoneAuth.value = false;
  }
}