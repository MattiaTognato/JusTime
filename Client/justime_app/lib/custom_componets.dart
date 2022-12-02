import 'package:flutter/material.dart';

import '../server_communication.dart';
import 'pages/home_page.dart';
import 'pages/welcome_page.dart';

class CustomElevatedButton extends StatelessWidget {
  late String buttonContent;

  late String requestType;
  late TextEditingController _username;
  late TextEditingController _email;
  late TextEditingController _password;
    late GlobalKey<FormState> _formKey;

  CustomElevatedButton(this._formKey, this.buttonContent, this.requestType, username, password,
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
            if (_formKey.currentState!.validate()) {
                sendData(requestType, _username.text, _password.text, _email.text);
                
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomePage();
                }));
            }

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
    late String boxType;
    late TextEditingController _controller;

    CustomTextBox(this.boxType, label, hint, controller, {super.key}) {
        _labelText = label;
        _hintText = hint;
        _controller = controller;
    }

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: const EdgeInsets.all(15),
            child: TextFormField(
                validator: ((value) {
                    RegExp checkEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                    RegExp checkNumber = RegExp(r'[0-9]');
                    RegExp checkUppercase = RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");

                    if(boxType == 'email')
                    {                      
                        if(checkEmail.hasMatch(value.toString()) == true)
                        {
                            return null;
                        }
                        else
                        {
                            return 'Inserisci indirizzo email valido!';
                        }
                    }
                    else if(boxType == 'password')
                    {
                        
                        

                        if (value.toString().length > 8 && checkNumber.hasMatch(value.toString()) == true && checkUppercase.hasMatch(value.toString()) == true) {
                            return null;
                        }
                        else{
                            return 'Inserisci password valida!\n(Minimo 8 caratteri, 1 lettera maiuscola e un numero)';
                        }
                    }
                    else if(boxType == 'username'){
                        if(value.toString().length > 10)
                        {
                            return 'Nome troppo lungo!';
                        }
                            else if(value.toString().length < 3)
                        {
                            return 'Nome troppo corto!';
                        }
                        else
                        {
                            return null;
                        }
                    }
                    else if(boxType == 'identifier')
                    {
                        if(checkEmail.hasMatch(value.toString()) == true)
                        {
                            return null;
                        }
                        else
                        {
                            if(value.toString().length < 3 || value.toString().length > 10)
                            {
                                return 'Inserisci indirizzo email o username valido valido!';
                            }
                            else{
                                return null;
                            }
                            
                        }
                    }
                }),
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
                    )
                )
                );
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
