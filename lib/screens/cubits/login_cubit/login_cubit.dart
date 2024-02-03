import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login({required var email, required var password}) async {
    emit(LoginLoading());
    try {
      // ignore: unused_local_variable
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        emit(LoginFailure(errorMessage: 'wrong-password'));
      } else if (e.code == 'user-not-found') {
        emit(LoginFailure(errorMessage: 'user not found'));
      }
    } catch (e) {
      emit(LoginFailure(errorMessage: 'something went wrong !'));
    }
  }
}
