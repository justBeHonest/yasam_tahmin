import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_tahmin/result_page.dart';
import 'package:yasam_tahmin/user_data.dart';

import './SomeContainer.dart';
import './sabitler.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet = null;
  double icilenSigara = 0;
  double sporSayisi = 0;
  double boy = 170;
  double kilo = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: LitleBox(
                    child: buildRowOutLineButton(
                      text: 'BOY',
                    ),
                  ),
                ),
                Expanded(
                  child: LitleBox(
                    child: buildRowOutLineButton(
                      text: 'KİLO',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: LitleBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Haftada Kaç Gün Spor Yapıyorsunuz?',
                      style: kMetinStili,
                    ),
                    Text(
                      sporSayisi.round().toString(),
                      style: kSayiStili,
                    ),
                    Slider.adaptive(
                      min: 0,
                      max: 7,
                      divisions: 7,
                      value: sporSayisi,
                      onChanged: (newDouble) {
                        setState(() {
                          sporSayisi = newDouble;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: LitleBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Günde Kaç Sigara İçiyorsunuz?',
                      style: kMetinStili,
                    ),
                    Text(
                      icilenSigara.round().toString(),
                      style: kSayiStili,
                    ),
                    Slider(
                      min: 0,
                      max: 60,
                      value: icilenSigara,
                      onChanged: (double newValue) {
                        setState(() {
                          icilenSigara = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: LitleBox(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = 'KADIN';
                        });
                      },
                      renk: seciliCinsiyet == 'KADIN'
                          ? Colors.lightBlue[100]
                          : Colors.white,
                      child: ManWomenBox(
                        icon: FontAwesomeIcons.venus,
                        text: 'KADIN',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: LitleBox(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = 'ERKEK';
                        });
                      },
                      renk: seciliCinsiyet == 'ERKEK'
                          ? Colors.lightBlue[100]
                          : Colors.white,
                      child: ManWomenBox(
                        icon: FontAwesomeIcons.mars,
                        text: 'ERKEK',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.lightBlue,
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              userData: UserData(
                                boy: boy,
                                icilenSigara: icilenSigara,
                                kilo: kilo,
                                seciliCinsiyet: seciliCinsiyet,
                                sporSayisi: sporSayisi,
                              ),
                            )));
              },
              child: Text(
                'HESAPLA',
                style: kMetinStili,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildRowOutLineButton({String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            text,
            style: kMetinStili,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            //kilo.round().toString(),
            text == 'BOY' ? boy.round().toString() : kilo.round().toString(),
            style: kSayiStili,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.lightBlue),
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 10,
                ),
                onPressed: () {
                  setState(() {
                    text == 'BOY' ? boy++ : kilo++;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.lightBlue),
                child: Icon(
                  FontAwesomeIcons.minus,
                  size: 10,
                ),
                onPressed: () {
                  setState(() {
                    text == 'BOY' ? boy-- : kilo--;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
