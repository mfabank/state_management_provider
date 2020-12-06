import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/counter.dart';
import 'package:state_management/sayacsayfasi.dart';

void main () {
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangeNotifierProvider<Counter>(
              create: (_)=> Counter(0),
              child: SayacSayfasi(),
            )));
          },

        ),
      ),
    );
  }
}
