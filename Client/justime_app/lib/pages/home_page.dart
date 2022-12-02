import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

import '../server_communication.dart';
import 'welcome_page.dart';
import '../clock.dart';


String dataFormat(String data)
{
    List<String> dataDivided = data.split('"');

    String username = dataDivided[3];
    String email = dataDivided[7];

    return "Username: $username \n\n Email: $email";
}


class HomePage extends StatelessWidget {
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(

            appBar: AppBar(
                title: const Text(
                    'Home Page'
                )
            ),

            resizeToAvoidBottomInset: false,
            body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    
                    FutureBuilder(
                        future: getUserInfo(),
                        initialData: "Loading text..",
                        builder: (BuildContext context, AsyncSnapshot<String?> text) {
                            return SingleChildScrollView(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Text(
                                dataFormat(text.data.toString()),
                                style: const TextStyle(
                                    fontFamily: 'Vidaloka',
                                    fontSize: 19.0,
                                    color: Colors.white
                                ),
                            ));
                    }),


                    StatusIndicator(),

                    Clock(),

                    Container(
                        margin: const EdgeInsets.only(top: 100.0, left: 15, right: 15),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 3,
                                shape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
                                minimumSize: const Size(400, 71),
                            ),
                            onPressed: () {
                                sendData('logout', '', '', '');
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return const WelcomePage(title: 'Home page',);
                                }));
                            },
                            child: const Text(
                                'Log Out',
                                style: TextStyle(
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



class StatusIndicator extends StatelessWidget {

    String getSystemTime() {
        var now = DateTime.now();
        return DateFormat("HH:mm:ss").format(now);
    }
    
    @override
    Widget build(BuildContext context) {
        return TimerBuilder.periodic(const Duration(seconds: 1), builder: (context) {;
            return Text(
            getSystemTime(),
            style: const TextStyle(
            fontFamily: 'VidaLoka',
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w700),
            );
        });
    }
  
}


