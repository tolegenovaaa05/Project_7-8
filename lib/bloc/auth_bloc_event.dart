part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocEvent {
  const AuthBlocEvent();
}

class SubmitRegistrationForm extends AuthBlocEvent {
  final User newUser;

  SubmitRegistrationForm(this.newUser);
}
