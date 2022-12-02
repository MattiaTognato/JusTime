import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';


import '../custom_componets.dart';

import 'welcome_page.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPage();
}

class _VerificationPage extends State<VerificationPage> {
  bool _onEditing = true;
  String? _code;


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    VerificationCode(
                        textStyle: TextStyle(fontSize: 20.0, color: Colors.red[900]),
                        keyboardType: TextInputType.number,
                        underlineColor: Colors.amber, // If this is null it will use primaryColor: Colors.red from Theme
                        length: 6,
                        cursorColor: Colors.blue, // If this is null it will default to the ambient
                        // clearAll is NOT required, you can delete it
                        // takes any widget, so you can implement your design
                        clearAll: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'clear all',
                            style: TextStyle(fontSize: 14.0, decoration: TextDecoration.underline, color: Colors.blue[700]),
                            ),
                        ),
                        onCompleted: (String value) {
                            setState(() {
                            _code = value;
                        });
                        },
                        onEditing: (bool value) {
                            setState(() {
                            _onEditing = value;
                        });
                        if (!_onEditing) FocusScope.of(context).unfocus();
                        },
                    ),

                    ],
                )),
            );
    }
}
