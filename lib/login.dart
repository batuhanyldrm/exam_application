import 'package:flutter/material.dart';
import 'package:mobile_application_final_project/questions.dart';
import 'package:mobile_application_final_project/error.dart';

class MyHomePage extends StatefulWidget {
  final formKey = GlobalKey<FormState>();
  late String email, password;

  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
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
              Padding(
                padding: const EdgeInsets.only(left: 80, right: 80),
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
            context, MaterialPageRoute(builder: (context) => Quiz()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Error()));
      }
    }
  }
}
