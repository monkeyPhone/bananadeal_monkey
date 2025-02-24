class InfoEditValidate {
  const InfoEditValidate();

  String passwordValidateDouble({
    required String password1,
    required String password2,
  }) {
    if(RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,}$").hasMatch(password1) &&
        RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,}$").hasMatch(password2) &&
        password1 == password2 &&
        password1.length <= 20 &&
        password2.length <= 20){
      return '';
    }
    else if(RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,}$").hasMatch(password1) &&
        RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,}$").hasMatch(password2) &&
        password1 != password2 &&
        password1.length <= 20 &&
        password2.length <= 20) {
      return '비밀번호가 일치하지 않습니다.';
    }
    else if(!RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,}$").hasMatch(password1)){

      return ('비밀번호의 조건이 충족되지 않습니다.');
    }
    else if(RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,}$").hasMatch(password1) && !RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,}$").hasMatch(password2)){
      return '비밀번호 확인의 조건이 충족되지 않습니다.';
    }
    else{
      return '비밀번호의 길이가 너무 깁니다.';
    }

  }


  String passwordValidate({
    required String password,
  }) {
    if(RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,}$").hasMatch(password) &&
        password.length <= 20){
      return '';
    }
    else if(!RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,}$").hasMatch(password)){

      return ('비밀번호의 조건이 충족되지 않습니다.');
    }
    else{
      return '비밀번호의 길이가 너무 깁니다.';
    }

  }

}