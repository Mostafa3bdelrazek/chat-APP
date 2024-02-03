// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  customTextField(
      {super.key, this.onChanged, this.labelText, this.obscureText = false});
  String? labelText;
  Function(String)? onChanged;
  bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}



//=================================
// TextFormField(
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Password must be not empty';
//                     }
//                     return null;
//                   },
//                   controller: passwordController,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     prefixIcon: const Icon(
//                       Icons.lock,
//                     ),
//                     suffixIcon: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           view = !view;
//                           if (view == true) {
//                             icon = Icons.remove_red_eye;
//                           } else {
//                             icon = Icons.visibility_off;
//                           }
//                         });
//                       },
//                       icon: Icon(
//                         icon,
//                       ),
//                     ),
//                     enabledBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   keyboardType: TextInputType.visiblePassword,
//                   obscureText: view,
//                 ),