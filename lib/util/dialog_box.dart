import 'package:flutter/material.dart';
import 'package:todoapp/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Add a new task',
                border: OutlineInputBorder(),
              ),
            ),
            // add button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // cancel button
                MyButton(text: 'Cancel', onTap: onCancel),
                const SizedBox(width: 8),
                // add button
                MyButton(text: 'Add', onTap: onSave),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
