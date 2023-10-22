import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_aruka_reg/user.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBlocBloc() : super(AuthBlocInitial()) {
    on<SubmitRegistrationForm>((event, emit) async {
      emit(LoadingState());
      try {
        await Future.delayed(Duration(seconds: 2));

        emit(SuccessState());
      } catch (e) {
        print("Error while processing SubmitRegistrationForm: $e");
        emit(ErrorState('Error: $e'));
      }
    });
  }
}
