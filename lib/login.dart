import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Hello World!")), body: const Body());
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name = "";
  TextEditingController controller = TextEditingController();

  void submit() {
    name = controller.text;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage(name)));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              suffixIcon: IconButton(
                icon: const Icon(Icons.done),
                splashColor: Colors.blueGrey,
                tooltip: "Submit",
                onPressed: submit,
              ),
              labelText: "Type your name:",
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
            ),
          ),
        ));
  }
}
