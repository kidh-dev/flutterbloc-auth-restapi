import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:desain/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({required this.userRepository}) : super(AuthenticationUninitialized()) {
    on<AppStarted>((event, emit) async{
      final bool hasToken = await userRepository.hasToken();
      if (hasToken) {
        emit(AuthenticationAuthenticated());
      } else {
        emit(AuthenticationUnauthenticated());
      }
    });

    on<LoggedIn>((event, emit) async{
      emit(AuthenticationLoading());
      await userRepository.persistToken(event.token);
      emit(AuthenticationAuthenticated());
    });

    on<LoggedOut>((event, emit) async{
      emit(AuthenticationLoading());
      await userRepository.deleteToken();
      emit(AuthenticationUnauthenticated());
    });
  }
}
