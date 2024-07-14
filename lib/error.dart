import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Error extends StatefulWidget {
  const Error({super.key});

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
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/unsuccessful.png"),
              ),
            ),
          ),
          const Center(
            child: Text(
              "Wrong e-mail or password please try again",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(const Size(120, 30))),
              onPressed: () => Navigator.pop(context),
              child: const Text('Go back!'),
            ),
          ),
        ],
      ),
    );
  }
}
