import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/auth_service.dart';
import 'package:state_management/counter.dart';
import 'package:state_management/sayacsayfasi.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text("Sayaç Sayfasına Geç"),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                      create: (_) => Counter(0),
                    ),
                    ChangeNotifierProvider(
                      create: (_) => AuthService(),
                    ),
                  ],
                  child: SayacSayfasi(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
