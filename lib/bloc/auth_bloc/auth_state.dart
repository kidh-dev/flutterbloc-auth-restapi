part of 'auth_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}
