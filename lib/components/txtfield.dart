import 'package:final_year_project/model/Model.dart';
import 'package:flutter/material.dart';

class nameField extends StatefulWidget {
  final ChatUser user;
   nameField({super.key, required this.user});

  @override
  State<nameField> createState() => _nameFieldState();
}

class _nameFieldState extends State<nameField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: false,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          hintText:  widget.user.name,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          )),
    );
  }
}

