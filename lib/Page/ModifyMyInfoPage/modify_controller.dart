import 'package:get/get.dart';

class ModifyController extends GetxController{
  int rightColor = 0xff0091ea;
  int errorColor = 0xffd32f2f;

  RxString phone = ''.obs;
  RxString phoneError = ''.obs;
  RxBool requestAuthentification = false.obs;
  RxInt phoneColor = 0xffeaeaea.obs;
  final String phonePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  void validatePhone(String? value){
    if(value == null){
      phoneError.value = '전화 번호를 입력해주세요.';
      phoneColor.value = errorColor;
    }else{
      RegExp regExp = RegExp(phonePattern);
      if(value.isEmpty){
        phoneError.value = '전화 번호를 입력해주세요.';
        phoneColor.value = errorColor;
      }else if(!regExp.hasMatch(value)){
        phoneError.value = '잘못된 전화 번호 형식입니다.';
        phoneColor.value = errorColor;
      }else{
        phoneError.value = '';
        phoneColor.value = rightColor;
      }
    }
  }
  RxInt authentification = 0.obs;
  RxString errorAuthentification = ''.obs;
  RxInt authColor = 0xffeaeaea.obs;
  void validateAuthentification(String? value){
    if(value == null){
      errorAuthentification.value = '인증번호를 입력해주세요.';
      authColor.value = errorColor;
    }else{
      if(value.isEmpty){
        errorAuthentification.value = '인증번호를 입력해주세요.';
        authColor.value = errorColor;
      }else{
        errorAuthentification.value = '';
        authColor.value = rightColor;
      }
    }
  }

  //비밀번호 확인
  RxString existingPwd = ''.obs;
  RxString errorExistingPwd = ''.obs;
  RxInt existingColor = 0xffeaeaea.obs;
  RxInt newPwdColor = 0xffeaeaea.obs;
  RxInt checkPwdColor = 0xffeaeaea.obs;
  RxString newPwd = ''.obs;
  RxString errorNewPwd = ''.obs;
  RxString checkPwd = ''.obs;
  RxString errorCheckPwd = ''.obs;

  void validateExistingPwd(String? value){
    if(value == null){
      errorExistingPwd.value = '비밀번호를 입력해주세요.';
      existingColor.value = errorColor;
    }else{
      if(value.isEmpty){
        errorExistingPwd.value = '비밀번호를 입력해주세요.';
        existingColor.value = errorColor;
      }else if(value != 'jakomo'){
        errorExistingPwd.value = '비밀번호가 틀립니다.';
        existingColor.value = errorColor;
      }else{
        errorExistingPwd.value = '';
        existingColor.value = rightColor;
      }
    }
  }
  void validateNewPwd(String? value){
    if(value == null){
      errorNewPwd.value = '비밀번호를 입력해주세요.';
      newPwdColor.value = errorColor;
    }else{
      if(value.isEmpty){
        errorNewPwd.value = '비밀번호를 입력해주세요.';
        newPwdColor.value = errorColor;
      }else{
        newPwd.value = value;
        errorNewPwd.value = '';
        newPwdColor.value = rightColor;
      }
    }
  }
  void validateCheckPwd(String? value){
    if(value == null){
      errorCheckPwd.value = '신규 비밀번호와 다릅니다.';
      checkPwdColor.value = errorColor;
    }else{
      if(value!=newPwd.value){
        errorCheckPwd.value = '신규 비밀번호와 다릅니다.';
        checkPwdColor.value = errorColor;
      }else{
        errorCheckPwd.value = '';
        checkPwdColor.value = rightColor;
      }
    }
  }
}