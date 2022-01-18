import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jakomo_recliner/Page/CommonUI/jakomo_regex.dart';

class SignInSocialController extends GetxController{
  final JakomoRegex jakomoRegex = JakomoRegex();
  final int rightColor = 0xff0091ea;
  final int errorColor = 0xffd32f2f;
  final int gallery = 0xffebebeb;
  final int boulder = 0xff757575;

  RxString id = ''.obs;
  RxInt idColor = 0xffebebeb.obs;
  RxInt idLabelColor = 0xff757575.obs;
  RxString errorId = ''.obs;
  void validateEmail(String? value){
    if(value != null && value != ''){
      if(jakomoRegex.isEmail(value)){
        errorId.value = '';
        idColor.value = rightColor;
        idLabelColor.value = rightColor;
        id.value = value;
      }else{
        errorId.value = '영문과 숫자를 조합하여 입력해주세요.';
        idColor.value = errorColor;
        idLabelColor.value = errorColor;
      }
    }else{
      errorId.value = '아메일을 입력해주세요.';
      idColor.value = errorColor;
      idLabelColor.value = errorColor;
    }
  }
  GlobalKey<FormState>? idKey = null;
  void setIdKey(GlobalKey<FormState> input){
    idKey = input;
    update();
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
  GlobalKey<FormState>? phoneKey = null;
  void setPhoneKey(GlobalKey<FormState> input){
    phoneKey = input;
    update();
  }

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
  RxBool didPhoneAuth = false.obs;
  RxString authPhone = ''.obs;
  RxString errorAuthPhone = ''.obs;
  RxInt authPhoneColor = 0xffebebeb.obs;
  RxInt authPhoneLabelColor = 0xff757575.obs;
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

  GlobalKey<FormState>? nameKey = null;
  void setNameKey(GlobalKey<FormState> input){
    nameKey = input;
    update();
  }

  RxBool didAllCheck = false.obs;
  RxBool didTermCheck = false.obs;
  RxBool didPersonalCheck = false.obs;
  RxBool didMarketingCheck = false.obs;
  RxBool didEmailCheck = false.obs;
  RxBool didPhoneCheck = false.obs;

  bool validateTotal(){
    if(errorId.value != ''){
      return false;
    }else{
      if(id.value == ''){
        return false;
      }else{
        if(canAuth.value == false){
          return false;
        }else{
          if(didPhoneAuth.value == false){
            return false;
          }else{
            if(didInsertName.value == false){
              return false;
            }else{
              if(didAllCheck.value == true){
                return true;
              }else{
                if(didTermCheck.value == false || didPersonalCheck.value == false){
                  return false;
                }else{
                  return true;
                }
              }
            }
          }
        }
      }
    }
  }
}