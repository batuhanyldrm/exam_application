import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Error extends StatefulWidget {
  const Error({Key? key}) : super(key: key);

  @override
  State createState() => ErrorState();
}

class ErrorState extends State<Error> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Wrong e-mail or password please try again",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(120, 30))),
              onPressed: () => Navigator.pop(context),
              child: const Text('Go back!'),
            ),
          ),
        ],
      ),
    );
  }
}
