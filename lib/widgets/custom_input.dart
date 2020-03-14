import 'package:flutter/material.dart';

enum FieldSize {
  small,
  medium,
}

class CustomInput extends StatelessWidget {
  String _value;

  get value => _value;

  final String header;
  final FieldSize fieldSize;

  CustomInput({Key key, this.header, this.fieldSize}) : assert(header!=null && fieldSize!=null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 160.0),
          child: Text(
            header,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          height: fieldSize==FieldSize.small ? 50.0 : 160.0,
          margin: EdgeInsets.symmetric(horizontal: 150.0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 17.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                // hintText: header,
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
              maxLines: fieldSize==FieldSize.small ? 1 : null,
              onChanged: (value) => _value = value,
            ),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}
