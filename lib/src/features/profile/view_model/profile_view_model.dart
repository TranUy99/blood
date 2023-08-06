
import '../../../../main.dart';
import '../../login/service/login_service.dart';

class ProfileViewModel {



}

getDataUser() async {
  getUser.userDTO =
  await UserService.userService(getUser.idUser!, getUser.token!);
}
