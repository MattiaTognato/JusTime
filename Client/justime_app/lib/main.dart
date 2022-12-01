import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

postData(username, email, password) async {
  var response =
      await http.post(Uri.parse('http://192.168.1.201/index.php/user/register'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "username": username,
            "email": email,
            "password": password,
          }));
  print(response.body);
  // var prova =
  //     await http.get(Uri.parse('http://192.168.1.201/index.php/user/info'));
  // print(prova.body);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: buildMaterialColor(const Color(0xff5E503F))),
        scaffoldBackgroundColor: const Color(0xff22333B),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  MaterialColor buildMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'JusTime',
              style: TextStyle(
                fontFamily: 'Vidaloka',
                fontSize: 48,
                color: Colors.white,
              ),
            ),
            const Divider(
              height: 50,
              thickness: 5,
              indent: 40,
              endIndent: 40,
              color: Color(0xff5E503F),
            ),
            const Text(
              'time for a change',
              style: TextStyle(
                fontFamily: 'Vidaloka',
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 100.0),
              child: Image.asset(
                'assets/img/watch.png',
                height: 250,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 100.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0)),
                  minimumSize: const Size(320, 71),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SecondPage();
                  }));
                },
                child: const Text(
                  'Accedi',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color.fromARGB(255, 223, 194, 194),
                  ),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ThirdPage();
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
        ),
      ),
    );
  }
}

class CustomTextBox extends TextField {}

class SecondPage extends StatelessWidget {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DistancedContainer(
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: _username,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 3, color: Color.fromARGB(255, 198, 172, 143)),
                ),
                border: OutlineInputBorder(),
                labelText: 'Nome',
                hintText: 'Inserisci nome',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          DistancedContainer(
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: _email,
              obscureText: true,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 3, color: Color.fromARGB(255, 198, 172, 143)),
                ),
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Inserisci email',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          DistancedContainer(
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: _password,
              obscureText: true,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 3, color: Color.fromARGB(255, 198, 172, 143)),
                ),
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Inserisci password',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 100.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0)),
                minimumSize: const Size(320, 71),
              ),
              onPressed: () {
                postData(_username.text, _email.text, _password.text);
              },
              child: const Text(
                'Accedi',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0)),
                minimumSize: Size(250, 60), //////// HERE
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MyHomePage(title: 'HomePage');
                }));
              },
              child: const Text(
                'Registrati',
                style: TextStyle(
                  fontFamily: 'WorkSans',
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class DistancedContainer extends Container {
  DistancedContainer(
      {super.key,
      Decoration? decoration,
      double? width,
      double? height,
      Widget? child})
      : super(width: width, height: height, child: child);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10, left: 50, right: 50),
      child: child,
    );
  }
}

class ThirdPage extends StatelessWidget {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  ThirdPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 30.0, bottom: 80),
            child: const Text("Registrazione",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Vidaloka",
                  fontSize: 48,
                ))),
        DistancedContainer(
            child: TextField(
          controller: _username,
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Color.fromARGB(255, 198, 172, 143)),
            ),
            border: OutlineInputBorder(),
            labelText: 'Nome',
            hintText: 'Inserisci nome',
            labelStyle: TextStyle(color: Colors.white),
            hintStyle: TextStyle(color: Colors.white),
          ),
        )),
        DistancedContainer(
            child: TextField(
          controller: _email,
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Color.fromARGB(255, 198, 172, 143)),
            ),
            border: OutlineInputBorder(),
            labelText: 'Email',
            hintText: 'Inserisci email',
            labelStyle: TextStyle(color: Colors.white),
            hintStyle: TextStyle(color: Colors.white),
          ),
        )),
        DistancedContainer(
            child: TextField(
          controller: _password,
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Color.fromARGB(255, 198, 172, 143)),
            ),
            border: OutlineInputBorder(),
            labelText: 'Password',
            hintText: 'Inserisci password',
            labelStyle: TextStyle(color: Colors.white),
            hintStyle: TextStyle(color: Colors.white),
          ),
        )),
        Container(
            margin: const EdgeInsets.only(top: 60),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0)),
                  minimumSize: const Size(320, 71),
                ),
                onPressed: () {},
                child: const Text(
                  "Registrati",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ))),
        Container(
            margin: const EdgeInsets.only(top: 20),
            child: TextButton(
              child: const Text("Torna indietro"),
              onPressed: () {
                Navigator.pop(context);
              },
            ))
      ],
    )));
  }
}
