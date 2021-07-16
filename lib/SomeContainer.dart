import 'package:flutter/material.dart';

class ManWomenBox extends StatelessWidget {
  final IconData icon;
  final String text;

  ManWomenBox({
    this.icon,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class LitleBox extends StatelessWidget {
  final Color renk;
  final Widget child;
  final Function onPress;

  LitleBox({
    this.renk = Colors.white,
    this.child,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: renk,
        ),
        margin: EdgeInsets.all(10.0),
      ),
    );
  }
}
