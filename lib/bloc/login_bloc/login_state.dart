part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable{
  const LoginState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState{
  final String error;

  const LoginFailure({required this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [error];

  @override
  String toString() {
    // TODO: implement toString
    return 'LoginFailure {error: $error}';
  }
}
