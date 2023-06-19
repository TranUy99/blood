class Validations {
  static bool isValiPhonenumber(String phonenumber) {
    return phonenumber != null &&
           phonenumber.length == 10 &&
           phonenumber.contains("0");
  }

  static bool isValiPass(String pass) {
    return pass != null && pass.length > 8;
  }
}
