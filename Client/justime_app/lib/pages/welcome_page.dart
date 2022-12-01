import 'package:flutter/material.dart';

import '../main.dart';

import 'login_page.dart';
import 'register_page.dart';

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
                    color: Colors.white,
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
        ),
      ),
    );
  }
}
