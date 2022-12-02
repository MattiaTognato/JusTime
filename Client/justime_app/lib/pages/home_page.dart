import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

import '../server_communication.dart';
import 'welcome_page.dart';

class HomePage extends StatelessWidget {
    

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                
            StatusIndicator(),

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



class StatusIndicator extends StatelessWidget {
    String getSystemTime() {
        var now = DateTime.now();
        return DateFormat("H:m:s").format(now);

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
