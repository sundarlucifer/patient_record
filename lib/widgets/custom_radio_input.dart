import 'package:flutter/material.dart';

class CustomRadioInput extends StatelessWidget {
  final String text;

  final bool isSelected;

  const CustomRadioInput({Key key, this.text, this.isSelected=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Theme.of(context).primaryColor),
              ),
            ),
            isSelected ? Container(
              height: 14.0,
              width: 14.0,
              margin: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Theme.of(context).primaryColor,
              ),
            ) : Center(),
          ],
        ),
        SizedBox(width: 10.0,),
        Text(
          text,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ],
    );
  }
}
