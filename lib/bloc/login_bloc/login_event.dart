part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  const LoginButtonPressed({required this.email, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];

  @override
  String toString() {
    // TODO: implement toString
    return 'LoginButtonPressed { email: $email, password: $password }';
  }
}
