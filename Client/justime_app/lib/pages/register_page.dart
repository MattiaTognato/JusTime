import 'package:flutter/material.dart';

import '../custom_componets.dart';

import 'welcome_page.dart';

class RegisterPage extends StatelessWidget {
	final TextEditingController _username = TextEditingController();
	final TextEditingController _email = TextEditingController();
	final TextEditingController _password = TextEditingController();


	RegisterPage({super.key});

	@override
	Widget build(BuildContext context) {
	return Scaffold(
        resizeToAvoidBottomInset: false,
		body: Center(
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
				Container(
					margin: const EdgeInsets.only(top: 30.0, bottom: 80),
					child: const Text( "Registrazione",
					style: TextStyle(
						color: Colors.white,
						fontFamily: "Vidaloka",
						fontSize: 48,
						)
					)
				),

				CustomTextBox('Nome', 'Inserisci il tuo nome', _username),
				CustomTextBox('Email', 'Inserisci email', _email),
				CustomTextBox('Password', 'Inserisci password', _password),        

				CustomElevatedButton('Registrati', 'register', _username, _password, _email),

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
			)
		)
	);
	}
}
