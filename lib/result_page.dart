import 'package:flutter/material.dart';
import 'package:yasam_tahmin/hesap.dart';
import 'package:yasam_tahmin/sabitler.dart';
import 'package:yasam_tahmin/user_data.dart';

class ResultPage extends StatelessWidget {
  final UserData userData;
  ResultPage({UserData this.userData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sonuç Sayfası',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(
              child: Text(
                Hesap(userData).hesaplama().round().toString(),
                style: kMetinStili,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Geri Dön',
                style: kMetinStili,
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                primary: Colors.lightBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
