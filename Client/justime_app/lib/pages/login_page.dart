import 'package:flutter/material.dart';

import '../custom_componets.dart';

import 'register_page.dart';

class LoginPage extends StatelessWidget {
    final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
    
    final TextEditingController _data = TextEditingController();
    final TextEditingController _password = TextEditingController();
    final TextEditingController p = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Container(
					margin: const EdgeInsets.only(top: 30.0, bottom: 80, right: 15, left: 15),
					child: const Text( "Un nuovo modo di vedere il tempo!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Vidaloka",
                            fontSize: 36,

                            )
					)
				),

                Form(
                    key: _formKey2,
                    child: Column(
                        children: [
                            CustomTextBox('identifier', 'Username o email', 'Inserisci username o password', _data),      
                            CustomTextBox('password', 'Password', 'Inserisci password', _password), 

                            CustomElevatedButton(_formKey2, 'Login', 'login', _data, _password, p),
                        ],
                    )
                ),

                Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RegisterPage();
                    }));
                  },
                  child: const Text(
                    'Registrati!',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xffEAE0D5),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ))
            ],
            )),
        );
    }
}
