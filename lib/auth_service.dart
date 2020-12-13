import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum KullaniciDurumu {
  OturumAciliyor,
  OturumAcilmis,
  OturumAcilmamis,
}

class AuthService with ChangeNotifier {
  //this is service
  final FirebaseAuth _auth = FirebaseAuth.instance;
  KullaniciDurumu _durum = KullaniciDurumu.OturumAcilmamis;

  User get user => _user;
  User _user;

  KullaniciDurumu get durum => _durum;

  set durum(KullaniciDurumu value) {
    _durum = value;
    notifyListeners();
  }

  AuthService() {
    _auth.authStateChanges().listen(_stateChanged);
  }

  _stateChanged(User user) {
    if (user == null) {
      _user =null;
      durum = KullaniciDurumu.OturumAcilmamis;
    } else {
      _user = user;
      durum = KullaniciDurumu.OturumAcilmis;
    }
  }

  Future<User> kullaniciOlustur(String email, String parola) async {
    try {
      durum = KullaniciDurumu.OturumAciliyor;
      UserCredential _credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: parola);
      User _yeniKullanici = _credential.user;
      _user = _yeniKullanici;
      return _yeniKullanici;
    } catch (e) {
      durum = KullaniciDurumu.OturumAcilmamis;
      debugPrint("Hata var $e");
      return null;
    }
  }

  Future<User> oturumAcma(String email, String parola) async {
    try {
      durum = KullaniciDurumu.OturumAciliyor;
      UserCredential _credential =
          await _auth.signInWithEmailAndPassword(email: email, password: parola);
      User _oturumAcanKullanici = _credential.user;
      _user = _oturumAcanKullanici;
      return _oturumAcanKullanici;
    } catch (e) {
      durum = KullaniciDurumu.OturumAcilmamis;
      debugPrint("Hata var $e");
      return null;
    }
  }

  Future<bool> cikisYap() async {
    try {
      await _auth.signOut();
      durum = KullaniciDurumu.OturumAcilmamis;
      _user = null;
      return true;
    } catch (e) {
      return false;
    }
  }
}
