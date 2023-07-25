abstract class ChangePasswordEvent {}

class ChangePasswordButtonPressedEvent extends ChangePasswordEvent{
  final String oldPassword;
  final String newPassword;


  ChangePasswordButtonPressedEvent({
    required this.oldPassword,
    required this.newPassword,
  
  });
}
