// ignore_for_file: file_names, avoid_print, sized_box_for_whitespace, use_build_context_synchronously
import 'package:chat_app/screens/Blocs/Auth_bloc/auth_bloc.dart';

import 'package:chat_app/screens/cubits/chat_cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../reusable component/const.dart';
import '../reusable component/custom_text_form_field.dart';
import '../reusable component/defaultButton.dart';
import '../reusable component/showSnakBar.dart';
import 'Register_screen.dart';
import 'chat_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  String? email;
  String? password;
  bool view = true;
  var icon = Icons.visibility_off;
  final myKey = GlobalKey<FormState>();
  bool isLoading = false;

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(email: email),
            ),
          );
          isLoading = false;
        } else if (state is LoginFailure) {
          isLoading = false;
          showSnakBar(context, state.errorMessage);
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: primaryColor,
          body: Form(
            key: myKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Image.asset('assets/images/scholar.png'),
                    const Text(
                      'scholar Chat',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                    const SizedBox(height: 120),
                    const Row(
                      children: [
                        Text(
                          'LOGIN',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    customTextField(
                      labelText: 'Email',
                      onChanged: (data) {
                        email = data;
                      },
                    ),
                    const SizedBox(height: 10),
                    customTextField(
                      obscureText: true,
                      labelText: 'Password',
                      onChanged: (data) {
                        password = data;
                      },
                    ),
                    const SizedBox(height: 20),
                    defaultButton(
                        text: 'LOGIN',
                        onPressed: () async {
                          if (myKey.currentState!.validate()) {
                            BlocProvider.of<AuthBloc>(context).add(
                                LoginEvent(email: email!, password: password!));
                          }
                        }),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account ?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ));
                            },
                            child: const Text(
                              "Register Now",
                              style: TextStyle(
                                color: Color(0XffC7EDE6),
                                fontSize: 15,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
