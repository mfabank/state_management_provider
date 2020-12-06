import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/counter.dart';

class SayacSayfasi extends StatefulWidget {
  @override
  _SayacSayfasiState createState() => _SayacSayfasiState();
}

class _SayacSayfasiState extends State<SayacSayfasi> {
  @override
  Widget build(BuildContext context) {
    var mySayac = Provider.of<Counter>(context);
    return Scaffold(
      body: Center(
        child: Text(mySayac.counter.toString(),style: TextStyle(fontSize: 100,fontWeight: FontWeight.bold),),
      ),
      floatingActionButton: MyActionButtons(),
    );
  }
}

class MyActionButtons extends StatefulWidget {
  @override
  _MyActionButtonsState createState() => _MyActionButtonsState();
}

class _MyActionButtonsState extends State<MyActionButtons> {
  @override
  Widget build(BuildContext context) {
    debugPrint("Build Tetiklendi");
    var mySayac = Provider.of<Counter>(context,listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: "1",
          child: Icon(Icons.thumb_up),
          backgroundColor: Colors.green,
          onPressed: mySayac.arttir,

        ),
        FloatingActionButton(
          heroTag: "2",
          child: Icon(Icons.thumb_down),
          backgroundColor: Colors.red,
          onPressed: () {
            context.read<Counter>().azalt();
          }
        ),
      ],
    );
  }
}

