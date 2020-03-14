import 'package:flutter/material.dart';
import 'package:patient_record/data/form_inputs.dart';
import 'package:patient_record/models/form_field.dart';
import 'package:patient_record/services/auth.dart';
import 'package:patient_record/widgets/custom_input.dart';


class RecordScreen extends StatefulWidget {
  @override
  _RecordScreenState createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  MySexRadioGroup sexField;
  MyResultRadioGroup resultField;

  List<CustomInput> _myFormFields = [];

  List<Widget> _fieldsList = [
    SizedBox(
      height: 80.0,
    ),
  ];

  void _validateAndSubmit() {
    Map<String, String> record = new Map();
    for (CustomInput myField in _myFormFields) {
      record[myField.header.toString()] = myField.value ?? 'Nil';
    }
    record["Sex"] = sexField.value;
    record["Result"] = resultField.value;
    authService.uploadRecord(record);
  }

  Widget _getSexField(BuildContext context) {
    return Container(
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
          sexField,
        ],
      ),
    );
  }

  Widget _getResultField(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(150.0, 0.0, 150.0, 30.0),
      child: Row(
        // added row to avoid centering of text
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(height: 10.0),
              resultField,
            ],
          ),
        ],
      ),
    );
  }

  Widget _getSubmitButton(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 150.0),
        height: 50.0,
        width: 500.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 3.0,
          ),
        ),
        child: InkWell(
          // splashColor: Colors.red,
          onTap: _validateAndSubmit,
          borderRadius: BorderRadius.circular(25.0),
          child: Center(
            child: Text(
              'Submit Record',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    sexField = new MySexRadioGroup();
    resultField = new MyResultRadioGroup();

    for (CustomFormField field in formFields) {
      _myFormFields.add(CustomInput(
        header: field.header,
        fieldSize: field.fieldSize,
      ));
      _fieldsList.add(_myFormFields.last);
    }

    // Added Future, to get context inside initState()
    Future.delayed(Duration.zero, () {
      // Used setState() as this function may be executed after build is called
      setState(() {
        _fieldsList.insert(4, _getSexField(context));

        // Results field with Radios
        _fieldsList.insert(9, _getResultField(context));
      });

      _fieldsList.add(SizedBox(height: 20.0));

      // Submit button
      _fieldsList.add(_getSubmitButton(context));

      _fieldsList.add(SizedBox(height: 50.0));
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
                      children: _fieldsList,
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

class MySexRadioGroup extends StatefulWidget {
  String sexRadioValue = 'Male';

  get value => sexRadioValue;

  @override
  _MySexRadioGroupState createState() => _MySexRadioGroupState();
}

class _MySexRadioGroupState extends State<MySexRadioGroup> {
  _onChanged(sex) {
    setState(() {
      widget.sexRadioValue = sex;
    });
    print(widget.sexRadioValue);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Radio(
          onChanged: _onChanged,
          value: 'Male',
          groupValue: widget.sexRadioValue,
          visualDensity: VisualDensity.compact,
        ),
        Text(
          'Male',
          style: TextStyle(fontSize: 24.0),
        ),
        Radio(
          onChanged: _onChanged,
          value: 'Female',
          groupValue: widget.sexRadioValue,
          visualDensity: VisualDensity.compact,
        ),
        Text(
          'Female',
          style: TextStyle(fontSize: 24.0),
        ),
      ],
    );
    ;
  }
}

class MyResultRadioGroup extends StatefulWidget {
  String resultRadioValue = results.first;

  get value => resultRadioValue;

  @override
  _MyResultRadioGroupState createState() => _MyResultRadioGroupState();
}

class _MyResultRadioGroupState extends State<MyResultRadioGroup> {
  _validateResult(result) {
    setState(() {
      widget.resultRadioValue = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(results.length, (index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Radio(
                  onChanged: _validateResult,
                  value: results[index],
                  groupValue: widget.resultRadioValue,
                  visualDensity: VisualDensity.compact,
                ),
                Text(
                  results[index],
                  style: TextStyle(fontSize: 24.0),
                ),
              ],
            );
          })),
    );
  }
}
