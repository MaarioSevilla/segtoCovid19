import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:segtocovid19/controllers/databasehelper_sgtofamily.dart';

class UpdateSymtomFamily extends StatefulWidget {

  final List list;
  final int index;

  UpdateSymtomFamily({this.list, this.index});

  @override
  _UpdateSymtomFamilyState createState() => _UpdateSymtomFamilyState();
}

class _UpdateSymtomFamilyState extends State<UpdateSymtomFamily> {

  DataBaseHelperSgtoFamily _helperSgtoFamily = new DataBaseHelperSgtoFamily();
  TextEditingController _notaFController;
  //sintoma variable global
  String _sintoma, _idSgtoF, _idsFamiliar;
  //DropdownButton
  int _value = 1;
  //para los datapicker
  String _date = "Not set";
  String _time = "Not set";

  //dats
  String _valueReal;
  bool dataChange=false, timeChange=false;
  String _day, _month,_year, _hours,_second, _minute;
  //variables datos recabados de
  String timeFrom;
  String _finalTime,dateAndTime;
  //para el picker muestre los datos obtenidos
  int year, month, day;
  //variables que almacenan y searan la fecha y la hora
  var _dates,_times;

  @override
  void initState(){
    this.iniciarVariables();
    super.initState();
  }

  iniciarVariables(){
    _idSgtoF= widget.list[widget.index]['idSgtoF'].toString();
    _idsFamiliar= widget.list[widget.index]['idsFamiliar'].toString();
    print(_idsFamiliar);
    _sintoma = widget.list[widget.index]['sintomaF'].toString();
    _valueReal = widget.list[widget.index]['gravedadF'].toString();
    timeFrom = widget.list[widget.index]['fechaHoraF'].toString();
    _notaFController = new TextEditingController(text: widget.list[widget.index]['notaF'].toString());

    if(_valueReal=='ninguno'){
      _value=1;
    }else if(_valueReal=='leve'){
      _value=2;
    }else if(_valueReal=='moderada'){
      _value=3;
    }else{
      _value=4;
    }

    var parts = timeFrom.split(' ');
    _dates = parts[0].trim().toString();
    _date = _dates.toString();
    print(_date);
    var partsDate = _dates.split('-');
    year = int.parse(partsDate[0].trim());
    month = int.parse(partsDate[1].trim());
    day = int.parse(partsDate[2].trim());
    print('$year $month $day');
    _times = parts[1].trim();
    _time = _times.toString();
    print(_time);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xffDA44bb), Color(0xffFB243A)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Editar Sintoma"),
        backgroundColor: Color(0xff3F005C),
      ),
      backgroundColor: Color(0xffE8E2EE),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            new Column(
              children: <Widget>[
                SizedBox(
                  height: size.width *.025,
                ),
                Text("Sintoma: $_sintoma", style: new TextStyle(fontSize: 18.0),),
                SizedBox(
                  height: size.width *.025,
                ),
                const Divider(
                  height: 1.0,
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
                        minTime: DateTime(2020, 1, 1),
                        maxTime: DateTime(2029, 12, 31), onConfirm: (date) {
                          print('confirm $date');
                          _date = '${date.year} - ${date.month} - ${date.day}';
                          _year='${date.year}';
                          year=int.parse('${date.year}');
                          if(date.month<10){
                            _month='0${date.month}';
                            month=int.parse('0${date.month}');
                          }else{
                            _month='${date.month}';
                            month=int.parse('${date.month}');
                          }
                          if(date.day<10){
                            _day='0${date.day}';
                            day=int.parse('0${date.day}');
                          }else{
                            _day='${date.day}';
                            day=int.parse('${date.day}');
                          }
                          dataChange=true;
                          setState(() {

                          });
                        }, currentTime: DateTime(year, month, day), locale: LocaleType.es);
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
                          timeChange=true;
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
                  height: size.width *.025,
                ),
                Text("Nota ", style: new TextStyle(fontSize: 18.0),),
                TextField(
                  controller: _notaFController,
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
                  height: size.width *.025,
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // Tres botones:
                      // LoginButton
                      new RaisedButton(
                        onPressed : () {
                          print('antes de $_finalTime');
                          print('antes de $_year');
                          print(dataChange);
                          print(timeChange);
                          if(dataChange==true && timeChange==true){
                            _finalTime=('$_year-$_month-$_day $_hours:$_minute:$_second');
                            print('ambos cambian $_finalTime');
                          }else if(timeChange==true){
                            _finalTime=('$_dates $_hours:$_minute:$_second');
                            print('tiempo cambia $_finalTime');
                          }else if(dataChange==true){
                            _finalTime=('$_year-$_month-$_day $_times');
                            print('fecha cambia $_finalTime');
                          }else if(dataChange==false && timeChange==false){
                            _finalTime=timeFrom;
                            print('nada cambio $_finalTime');
                          }

                          if(_value==1){
                            _valueReal="ninguno";
                          }else if(_value==2){
                            _valueReal="leve";
                          }else if(_value==3){
                            _valueReal="moderada";
                          }else if(_value==4){
                            _valueReal="grave";
                          }

                          _helperSgtoFamily.editarData(_idSgtoF, _idsFamiliar, _sintoma, _valueReal, _finalTime, _notaFController.text.trim());

                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Color(0xff892BEF), Color(0xffDE149C)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 400.0, minHeight: 40.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Guardar Cambios",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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

  CustomPicker({DateTime currentTime, LocaleType locale})
      : super(locale: locale) {
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