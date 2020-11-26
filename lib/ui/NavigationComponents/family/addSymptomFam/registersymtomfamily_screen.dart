import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:segtocovid19/clases/datasymptom.dart';
import 'package:segtocovid19/controllers/databasehelper_sgtofamily.dart';

class RegisterNewSymptomFamily extends StatefulWidget {
  final List list;
  final index;
  final Symptom symptom;
  RegisterNewSymptomFamily({this.index,this.list,this.symptom});

  @override
  _RegisterNewSymptomFamilyState createState() => _RegisterNewSymptomFamilyState();
}

class _RegisterNewSymptomFamilyState extends State<RegisterNewSymptomFamily> {
  String sintoma;
  int _value = 1;
  String _date = "Not set";
  String _time = "Not set";
  String dateAndTime, _valueReal;
  String _nombreF, _idFamiliar;
  String _day, _month,_year, _hours,_second, _minute;
  final TextEditingController _notaF = TextEditingController();
  DataBaseHelperSgtoFamily _helperSgtoFamily = new DataBaseHelperSgtoFamily();

  @override
  void initState(){
    super.initState();
    _nombreF=widget.list[widget.index]['nombreF'].toString();
    _idFamiliar=widget.list[widget.index]['idFamiliar'].toString();
    sintoma = widget.symptom.sintoma;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xffDA44bb), Color(0xffFB243A)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de sintoma Familiar'),
        backgroundColor: Color(0xff3F005C),
      ),
      backgroundColor: Color(0xffE8E2EE),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.width *.025,
            ),
            Text('$_idFamiliar $_nombreF $sintoma'),
            SizedBox(
              height: size.width *.025,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 40, bottom: 10),
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF982CAD).withOpacity(0.9),
                    Color(0xFF530085).withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.width *.05),
                  SizedBox(
                    width: size.width *1,
                    child: Text("$sintoma",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(2),
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFBFBFB),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.width *.05,
            ),
            Text('Seleciona la fecha y hora',
              textAlign: TextAlign.left,
              style: new TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient
              ),
            ),
            SizedBox(
              height: size.width *.05,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              elevation: 0.0,
              onPressed: () {
                DatePicker.showDatePicker(context,
                    theme: DatePickerTheme(
                      containerHeight: 210.0,
                    ),
                    showTitleActions: true,
                    minTime: DateTime(2000, 1, 1),
                    maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                      print('confirm $date');
                      _date = '${date.year} - ${date.month} - ${date.day}';
                      _year='${date.year}';
                      if(date.month<10){
                        _month='0${date.month}';
                      }else{
                        _month='${date.month}';
                      }
                      if(date.day<10){
                        _day='0${date.day}';
                      }else{
                        _day='${date.day}';
                      }
                      setState(() {});
                    }, currentTime: DateTime.now(), locale: LocaleType.es);
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.date_range,
                                size: 18.0,
                                color: Colors.purple,
                              ),
                              Text(
                                " $_date",
                                style: TextStyle(
                                    color: Color(0xff616161),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      "  Cambiar",
                      style: TextStyle(
                          color: Color(0xFF982CAD).withOpacity(0.9),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              color: Colors.white,
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              elevation: 0.0,
              onPressed: () {
                DatePicker.showTimePicker(context,
                    theme: DatePickerTheme(
                      containerHeight: 210.0,
                    ),
                    showTitleActions: true, onConfirm: (time) {
                      print('confirm $time');
                      print('confirm ${time.hour}');
                      _time = '${time.hour} : ${time.minute} : ${time.second}';
                      if(time.hour<10){
                        _hours='0${time.hour}';
                      }else{
                        _hours='${time.hour}';
                      }
                      if(time.minute<10){
                        _minute='0${time.minute}';
                      }else{
                        _minute='${time.minute}';
                      }
                      if(time.second<10){
                        _second='0${time.second}';
                      }else{
                        _second='${time.second}';
                      }
                      setState(() {});
                    }, currentTime: DateTime.now(), locale: LocaleType.es);
                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 18.0,
                                color: Colors.purple,
                              ),
                              Text(
                                " $_time",
                                style: TextStyle(
                                    color: Color(0xff616161),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      "  Cambiar",
                      style: TextStyle(
                          color: Color(0xFF982CAD).withOpacity(0.9),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              color: Colors.white,
            ),
            SizedBox(
              height: size.width *.05,
            ),
            Text('Seleciona la gravedad del sintoma',
              style: new TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient
              ),
            ),
            SizedBox(
              height: size.width *.05,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  colors: [
                    Color(0xffFFFFFF).withOpacity(0.7),
                    Color(0xffFFFFFF).withOpacity(0.7),
                  ],
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text('Ninguna',
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF982CAD).withOpacity(0.9),
                        ),
                      ),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Leve",
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF982CAD).withOpacity(0.9),
                        ),
                      ),
                      value: 2,
                    ),
                    DropdownMenuItem(
                        child: Text("Moderada",
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF982CAD).withOpacity(0.9),
                          ),
                        ),
                        value: 3
                    ),
                    DropdownMenuItem(
                        child: Text("Grave",
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF982CAD).withOpacity(0.9),
                          ),
                        ),
                        value: 4
                    )
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                      print(_value);
                    });
                  },
                  isExpanded: true,
                ),
              ),
            ),
            SizedBox(
              height: size.width *.05,
            ),
            Text('Ingresa algun comentario',
              style: new TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient
              ),
            ),
            SizedBox(
              height: size.width *.025,
            ),
            TextField(
              controller: _notaF,
              maxLength: 225,
              decoration: InputDecoration(
                hintText: "Ingresa una nota",
                counterText: '',
                contentPadding: EdgeInsets.all(10.0),
                hintStyle: TextStyle( color: Colors.black),
                border: InputBorder.none,
              ),
            ),
            SizedBox(
              height: size.width *.05,
            ),
            Container(
              margin: EdgeInsets.only(top: 0, right: 2, left: 2, bottom: 20),
              alignment: Alignment.center,
              constraints: BoxConstraints(maxWidth: 400.0, minHeight: 90.0),
              child: FlatButton(
                color: Color(0xffFB8274),
                textColor: Colors.white,
                disabledColor: Colors.grey,
                splashColor: Color(0xff3F005C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text("Guardar registro",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.6),
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  if(_date=="Not set" || _time=="Not set"){
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Alerta'),
                        content: Text('Seleccione la fecha y la hora'),
                      ),
                    );
                  }else{
                    ///asignacion del valor real del select gravedad
                    if(_value==1){
                      _valueReal="ninguno";
                    }else if(_value==2){
                      _valueReal="leve";
                    }else if(_value==3){
                      _valueReal="moderada";
                    }else if(_value==4){
                      _valueReal="grave";
                    }
                    ///asignacion de la fecha
                    dateAndTime=('$_year-$_month-$_day $_hours:$_minute:$_second');
                    await _helperSgtoFamily.addDataSymptomFam(_idFamiliar, sintoma, _valueReal, dateAndTime, _notaF.text.trim());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomPicker extends CommonPickerModel {

  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  CustomPicker({DateTime currentTime, LocaleType locale}) : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    this.setLeftIndex(this.currentTime.hour);
    this.setMiddleIndex(this.currentTime.minute);
    this.setRightIndex(this.currentTime.second);
  }

  @override
  String leftStringAtIndex(int index) {
    if (index >= 0 && index < 24) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String middleStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String rightStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String leftDivider() {
    return "|";
  }

  @override
  String rightDivider() {
    return "|";
  }

  @override
  List<int> layoutProportions() {
    return [1, 2, 1];
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(currentTime.year, currentTime.month, currentTime.day,
        this.currentLeftIndex(), this.currentMiddleIndex(), this.currentRightIndex())
        : DateTime(currentTime.year, currentTime.month, currentTime.day, this.currentLeftIndex(),
        this.currentMiddleIndex(), this.currentRightIndex());
  }
}