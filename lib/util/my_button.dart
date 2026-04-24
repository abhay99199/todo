import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onTap;
   MyButton({super.key, required this.text, required this.onTap });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onTap,
      color: Theme.of(context).primaryColor,
      child: Text(text),

    );
  }
}
