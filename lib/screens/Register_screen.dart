// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names, use_build_context_synchronously
import 'package:chat_app/screens/cubits/Register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../reusable component/const.dart';
import 'chat_screen.dart';
import '../reusable component/custom_text_form_field.dart';
import '../reusable component/defaultButton.dart';
import '../reusable component/showSnakBar.dart';

class RegisterScreen extends StatelessWidget {
  String? email;
  String? password;
  bool view = true;
  var icon = Icons.visibility_off;
  final myKey = GlobalKey<FormState>();
  bool isLoading = false;
  RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          // BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(email: email),
            ),
          );
          isLoading = false;
        } else if (state is RegisterFailure) {
          isLoading = false;
          showSnakBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
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
                            'REGISTER',
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
                          text: 'REGISTER',
                          onPressed: () async {
                            if (myKey.currentState!.validate()) {
                              BlocProvider.of<RegisterCubit>(context)
                                  .register(email: email!, password: password!);
                            }
                          }),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "already have an account",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Color(0XffC7EDE6),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
