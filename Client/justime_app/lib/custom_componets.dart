import 'package:flutter/material.dart';

import '../server_communication.dart';
import 'pages/home_page.dart';

class CustomElevatedButton extends StatelessWidget {
  late String buttonContent;

  late String requestType;
  late TextEditingController _username;
  late TextEditingController _email;
  late TextEditingController _password;

  CustomElevatedButton(this.buttonContent, this.requestType, username, password,
      [email]) {
    _username = username;
    _password = password;
    _email = email;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100.0, left: 15, right: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
          minimumSize: const Size(400, 71),
        ),
        onPressed: () {
            sendData(requestType, _username.text, _password.text, _email.text);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return HomePage();
            }));
        },
        child: Text(
          buttonContent,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CustomTextBox extends StatelessWidget {
  String _labelText = "Sample";
  String _hintText = "Sample";
  late TextEditingController _controller;

  CustomTextBox(label, hint, controller, {super.key}) {
    _labelText = label;
    _hintText = hint;
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        child: TextField(
            style: const TextStyle(color: Colors.white),
            controller: _controller,
            decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Color(0xffC6AC8F)),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Color(0xffC6AC8F)),
            ),
            border: const OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Color(0xffC6AC8F)),
            ),
            labelText: _labelText,
            hintText: _hintText,
            hintStyle: const TextStyle(color: Colors.white),
            labelStyle: const TextStyle(color: Colors.white),
            ),
        ));
  }
}
