import 'package:final_year_project/model/Model.dart';
import 'package:flutter/material.dart';

import '../auth/api/apis.dart';

class emailField extends StatefulWidget {
  final ChatUser user;
  emailField({super.key, required this.user});

  @override
  State<emailField> createState() => _emailFieldState();
}

class _emailFieldState extends State<emailField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: false,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          hintText:  widget.user.email,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          )),
    );
  }
}

