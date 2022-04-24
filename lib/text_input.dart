import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final Function(String) callback;
  const TextInput(this.callback, {Key? key}) : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void press() {
    widget.callback(controller.text);
    controller.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.message),
        suffixIcon: IconButton(
          onPressed: press,
          icon: const Icon(Icons.send),
          splashColor: Colors.blueGrey,
          tooltip: "Post message",
        ),
        labelText: "Type a message:",
      ),
    );
  }
}
