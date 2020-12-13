import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/auth_service.dart';
import 'package:state_management/counter.dart';

class SayacSayfasi extends StatefulWidget {
  @override
  _SayacSayfasiState createState() => _SayacSayfasiState();
}

class _SayacSayfasiState extends State<SayacSayfasi> {
  @override
  Widget build(BuildContext context) {
    var mySayac = Provider.of<Counter>(context);

    final myAuth = Provider.of<AuthService>(context);

    if (myAuth.durum == KullaniciDurumu.OturumAciliyor) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (myAuth.durum == KullaniciDurumu.OturumAcilmamis) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Lütfen Oturum Açın",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            ),
            RaisedButton(
              child: Text("Oturum Aç"),
              color: Colors.indigo,
              onPressed: () async{
                await myAuth.oturumAcma("deneme@deneme.com", "1234567");
              },
            ),
            RaisedButton(
              child: Text("Kayıt Ol"),
              color: Colors.blueGrey,
              onPressed: () async{
                await myAuth.kullaniciOlustur("deneme@deneme.com", "1234567");
              },
            ),
          ],
        ),
      );
    } else if (myAuth.durum == KullaniciDurumu.OturumAcilmis) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
          title: Text(Provider.of<AuthService>(context).user.email),
          leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: (){
              context.read<AuthService>().cikisYap();
            },
          ),
        ),
        body: Center(
          child: Text(
            mySayac.counter.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 150),
          ),
        ),
        floatingActionButton: MyFloatingActionButtons(),
      );
    }
  }
}

class MyFloatingActionButtons extends StatefulWidget {
  @override
  _MyFloatingActionButtonsState createState() =>
      _MyFloatingActionButtonsState();
}

class _MyFloatingActionButtonsState extends State<MyFloatingActionButtons> {
  @override
  Widget build(BuildContext context) {
    debugPrint("Yeniden tetiklendi ");
    //var mySayac = Provider.of<Counter>(context,listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: "1",
          child: Icon(Icons.thumb_up),
          backgroundColor: Colors.green,
          onPressed: () {
            context.read<Counter>().arttir();
          },
        ),
        FloatingActionButton(
          heroTag: "2",
          child: Icon(Icons.thumb_down),
          backgroundColor: Colors.red,
          onPressed: () {
            context.read<Counter>().azalt();
          },
        ),
      ],
    );
  }
}
