import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:segtocovid19/controllers/databasehelper_temperature.dart';

class UpdateFever extends StatefulWidget {

  final List list;
  final int index;

  UpdateFever({this.list, this.index});

  @override
  _UpdateFeverState createState() => _UpdateFeverState();
}

class _UpdateFeverState extends State<UpdateFever> {

  DataBaseHelperTemperature _helperTemperature = new DataBaseHelperTemperature();

  //para los datapicker
  String _date = "Not set";
  String _time = "Not set";
  //dats
  bool dataChange=false, timeChange=false;
  String _day, _month,_year, _hours,_second, _minute;
  //variables datos recabados de
  String timeFrom;
  String _finalTime, _finalId, _finalMatricula,dateAndTime;
  //para el picker muestre los datos obtenidos
  int year, month, day;
  //variables que almacenan y searan la fecha y la hora
  var _dates,_times;

  TextEditingController _temperaturaController;

  @override
  void initState(){
    this.iniciarVariables();
    super.initState();
  }

  iniciarVariables(){
    _temperaturaController = new TextEditingController(text: widget.list[widget.index]['temperatura'].toString());
    _finalMatricula = widget.list[widget.index]['idMatricula'].toString();
    _finalId = widget.list[widget.index]['idSgtoTemp'].toString();
    timeFrom = widget.list[widget.index]['fecha'].toString();
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
    return GestureDetector(
        onTap:(){
          FocusScope.of(context).unfocus();
        } ,
        child: new Scaffold(
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
                    SizedBox(
                      width: size.width *.5,
                      height: size.width*.2,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                        decoration: BoxDecoration(
                          color: Color(0xffF9FAFB),
                          borderRadius: BorderRadius.circular(29.5),
                        ),
                        child: TextField(
                          controller: _temperaturaController,
                          maxLength: 4,
                          decoration: InputDecoration(
                            hintText: "Temperatura",
                            counterText: '',
                            contentPadding: EdgeInsets.all(10.0),
                            hintStyle: TextStyle( color: Colors.black),
                            icon: Icon(
                              Ionicons.ios_thermometer,
                              color: Colors.purple,
                            ),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          //keyboard con okay
                          //keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width *.05,
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
                            onPressed : () async {
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
                              _helperTemperature.editarData( _finalId, _finalMatricula, _finalTime, _temperaturaController.text.trim());
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
                                constraints: BoxConstraints(maxWidth: 500.0, minHeight: 40.0),
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