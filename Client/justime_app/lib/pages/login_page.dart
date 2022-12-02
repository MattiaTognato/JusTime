import 'package:flutter/material.dart';

import '../custom_componets.dart';

import 'welcome_page.dart';

class LoginPage extends StatelessWidget {
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

                CustomTextBox('Username o email', 'Inserisci username o password', _data),
                CustomTextBox('Password', 'Inserisci password', _password),

                CustomElevatedButton('Accedi', 'login', _data, _password, p),

                Container(
					margin: const EdgeInsets.only(top: 20),
					child: TextButton(
					child: const Text("Torna indietro"),
					onPressed: () {
						Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const MyHomePage(title: 'HomePage');
                        }));
					},
				))
            ],
            )),
        );
    }
}
