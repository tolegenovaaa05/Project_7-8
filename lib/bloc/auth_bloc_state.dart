part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocState {
  const AuthBlocState();
}

class AuthBlocInitial extends AuthBlocState {
  const AuthBlocInitial();
}

class LoadingState extends AuthBlocState {
  const LoadingState();
}

class SuccessState extends AuthBlocState {
  const SuccessState();
}

class ErrorState extends AuthBlocState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}
