import 'package:flutter/material.dart';

import '../server_communication.dart';

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


 printInteger() {

    // at any time, we can get the text from _controller.value.text
    final text = _controller.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty6u 467u47u4';
    }
    if (text.length < 4) {
      return 'Too short';
    } else if (text.length > 4) {
      return '';
    }
    // return null if the text is valid
    return null;
  }
}


  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        child: TextField(
            onChanged: (value) {},
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
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 129, 124, 124)),
              labelStyle:
                  const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              errorStyle:
                  const TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
              errorText: _errorText,
            )));
  }
}

class TextSubmitWidget extends StatefulWidget {
  const TextSubmitWidget({Key? key, required this.onSubmit}) : super(key: key);
  final ValueChanged<String> onSubmit;

  @override
  State<TextSubmitWidget> createState() => _TextSubmitWidgetState();
}

class _TextSubmitWidgetState extends State<TextSubmitWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Enter your name',
            // TODO: add errorHint
          ),
        ),
        ElevatedButton(
          // TODO: implement callback
          onPressed: () {},
          child: Text(
            'Submit',
            style: Theme.of(context).textTheme.headline6,
          ),
        )
      ],
    );
  }
}
