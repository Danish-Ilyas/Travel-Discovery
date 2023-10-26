import 'package:final_year_project/model/Model.dart';
import 'package:flutter/material.dart';

class imageField extends StatefulWidget {
  final ChatUser user;
  imageField({super.key, required this.user});

  @override
  State<imageField> createState() => _imageFieldState();
}

class _imageFieldState extends State<imageField> {
  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: CircleAvatar(
        radius: 50,
        child: Image.network(widget.user.image,fit: BoxFit.cover,),
      ),
    );
  }
}

