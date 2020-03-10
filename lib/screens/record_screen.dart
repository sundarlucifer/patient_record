import 'dart:html';

import 'package:flutter/material.dart';
import 'package:patient_record/data/form_inputs.dart';
import 'package:patient_record/models/form_field.dart';
import 'package:patient_record/widgets/custom_input.dart';
import 'package:patient_record/widgets/custom_radio_input.dart';

class RecordScreen extends StatefulWidget {
  @override
  _RecordScreenState createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  List<Widget> _inputFields = [
    SizedBox(
      height: 80.0,
    ),
  ];

  @override
  void initState() {
    for (CustomFormField field in formFields) {
      _inputFields.add(CustomInput(
        header: field.header,
        fieldSize: field.fieldSize,
      ));
    }

    _inputFields.add(
      SizedBox(height: 50.0),
    );

    // Added Future, to get context in initState()
    Future.delayed(Duration.zero, () {
      // Used setState() as this function may be executed after build is called
      setState(() {
        _inputFields.insert(
          4,
          Container(
            margin: EdgeInsets.fromLTRB(150.0, 0.0, 150.0, 30.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Age',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  height: 50.0,
                  width: 100.0,
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
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 40.0,
                ),
                Text(
                  'Sex',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                CustomRadioInput(
                  text: 'Male',
                  isSelected: true,
                ),
                SizedBox(
                  width: 20.0,
                ),
                CustomRadioInput(text: 'Female'),
              ],
            ),
          ),
        );
        _inputFields.insert(
          9,
          Container(
            color: Colors.red,
            margin: EdgeInsets.fromLTRB(150.0, 0.0, 150.0, 30.0),
            child: Row(
              // added row to avoid centering of text
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Result',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        );
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/bg-image.png'),
            ),
            Container(
              height: 2381.0,
              width: double.infinity,
              color: Theme.of(context).primaryColor.withOpacity(0.7),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 60.0,
                  ),
                  Text(
                    'Patient Record',
                    style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Container(
                    width: 800.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: _inputFields,
                      /*<Widget>[
                        CustomInput(
                          header: 'Patient name',
                          fieldSize: FieldSize.small,
                        ),
                        CustomInput(
                          header: 'Address',
                          fieldSize: FieldSize.medium,
                        ),
                        CustomInput(
                          header: 'Contact Number',
                          fieldSize: FieldSize.small,
                        ),
                        CustomInput(
                          header: 'Provisional Diagnosis',
                          fieldSize: FieldSize.medium,
                        ),
                        CustomInput(
                          header: 'Investigations (if any)',
                          fieldSize: FieldSize.medium,
                        ),
                        CustomInput(
                          header: 'Final diagnosis',
                          fieldSize: FieldSize.small,
                        ),
                        CustomInput(
                          header: 'Treatment',
                          fieldSize: FieldSize.medium,
                        ),
                        CustomInput(
                          header: 'Additional information (if any)',
                          fieldSize: FieldSize.medium,
                        ),
                      ],
                      */
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
