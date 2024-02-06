import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> register({required var email, required var password}) async {
    emit(RegisterLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errorMessage: 'weak-password'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errorMessage: 'email is already in use'));
      }
    } catch (e) {
      emit(RegisterFailure(errorMessage: 'something went wrong !'));
    }
  }

  Future<void> login({required var email, required var password}) async {
    emit(LoginLoading());
    try {
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
