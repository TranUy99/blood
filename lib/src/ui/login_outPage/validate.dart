class Validate {
  static bool checkInvalidateNewPassword(String str) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (!regex.hasMatch(str)) {
      return true;
    } else {
      return false;
    }
  }

  static bool checkNotEqualNewPassword(
      String newPassword, String reNewPassword) {
    if (newPassword != reNewPassword) {
      return true;
    }
    return false;
  }

  static bool invalidateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";

    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }

  static bool invalidateMobile(String? value) {
    final regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10}$)');

    if (value == null || value.isEmpty || !regExp.hasMatch(value)) {
      return true;
    }
    return false;
  }

  static bool invalidateOnlyWord(String? value) {
    RegExp rex = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');
    if (value == null) {
      return true;
    }
    if (rex.hasMatch(value)) {
      return true;
    }
    return false;
  }
  static bool validName1(String? value) {
    RegExp rex = RegExp(  r'^[a-zA-Z]+(?: )+$');
    if (value == null) {
      return false;
    }
    if (rex.hasMatch(value)) {
      return false;
    }
    return true;
  }
  static bool validName2(String? value) {
    RegExp rex = RegExp(   r'^[a-zA-Z]$');
    if (value == null) {
      return false;
    }
    if (rex.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static bool validFullName(String? value){
    RegExp rex = RegExp(r'^[A-Za-z\s-]{1,}$');
    if (value == null) {
      return false;
    }
    if (rex.hasMatch(value)) {
      return false;
    }
    return true;
  }
}