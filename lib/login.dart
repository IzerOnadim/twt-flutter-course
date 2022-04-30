import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';
import 'auth.dart';

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
  User? user;
  String displayName = "";

  @override
  void initState() {
    super.initState();
    Authentication.signOut(context: context);
  }

  void submit() {
    Authentication.signInWithGoogle(context: context).then((user) => {
          this.user = user,
          displayName = (user != null && user.displayName != null
              ? user.displayName
              : "Unknown user")!,
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePage(displayName)))
        });
  }

  Widget googleLoginButton() {
    return OutlinedButton(
      onPressed: submit,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        splashFactory: InkSplash.splashFactory,
        side: const BorderSide(color: Colors.grey),
        padding: const EdgeInsets.all(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Image(image: AssetImage("assets/google_logo.png"), height: 35),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Sign in with Google",
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.center, child: googleLoginButton());
  }
}
