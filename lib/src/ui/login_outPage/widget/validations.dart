class Validations {
  static bool isValidPhone(String phone) {
    return phone != null && phone.length == 10;
  }

  static bool isValidPass(String pass) {
    return pass != null && pass.length > 8;
  }
}
