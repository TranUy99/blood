abstract class ChangePasswordEvent {}

//create event button change password 
class ChangePasswordButtonPressedEvent extends ChangePasswordEvent{
  final String oldPassword;
  final String newPassword;


  ChangePasswordButtonPressedEvent({
    required this.oldPassword,
    required this.newPassword,
  
  });
}
