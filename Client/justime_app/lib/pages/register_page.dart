import 'package:flutter/material.dart';
import 'package:justime_app/pages/login_page.dart';

import '../custom_componets.dart';

import 'welcome_page.dart';

class RegisterPage extends StatelessWidget {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

                Form(
                    key: _formKey,
                    child: Column(
                        children: [
                            CustomTextBox('username', 'Nome', 'Inserisci il tuo nome', _username),
				            CustomTextBox('email', 'Email', 'Inserisci email', _email),      
                            CustomTextBox('password', 'Password', 'Inserisci password', _password), 

                            CustomElevatedButton(_formKey, 'Registrati', 'register', _username, _password, _email),
                        ],
                    )
                ),
                 

				

                Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: TextButton(
                    onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                        return LoginPage();
                        }));
                    },
                    child: const Text(
                        'Accedi!',
                        style: TextStyle(
                        fontSize: 17,
                        color: Color(0xffEAE0D5),
                        decoration: TextDecoration.underline,
                        ),
                    ),
                ))
            ],
			)
		)
	);
	}
}
