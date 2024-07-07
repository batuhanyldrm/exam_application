import 'package:flutter/material.dart';
import 'package:mobile_application_final_project/categories.dart';
/* import 'package:mobile_application_final_project/error.dart'; */

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  final formKey = GlobalKey<FormState>();
  late String email, password;

  final String title;

  MyHomePage({super.key, required this.title});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Categories(),
      ),
    );
  }
}

/* class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: widget.formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/user.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, right: 80, top: 10),
                child: TextFormField(
                  validator: (input) {
                    if (input!.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                  onSaved: (input) => widget.email = input!,
                  decoration: InputDecoration(
                    labelText: 'Email: batu@gmail.com',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, right: 80, top: 20),
                child: TextFormField(
                  validator: (input) {
                    if (input!.length < 6) {
                      return 'Your password needs to be at least 6 characters';
                    }
                    return null;
                  },
                  onSaved: (input) => widget.password = input!,
                  decoration: InputDecoration(
                    labelText: 'Password: batu52',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.grey),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () => submit(),
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submit() {
    if (widget.formKey.currentState!.validate()) {
      widget.formKey.currentState!.save();
      if (widget.email == "batu@gmail.com" && widget.password == "batu52") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Categories()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Error()));
      }
    }
  }
} */
