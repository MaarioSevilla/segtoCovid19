import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:segtocovid19/controllers/databasehelper_user.dart';

class ResultadoCovidScreen extends StatefulWidget {
  @override
  _ResultadoCovidScreenState createState() => _ResultadoCovidScreenState();
}

class _ResultadoCovidScreenState extends State<ResultadoCovidScreen> {

  var switchValue = false;
  bool hola =false, firstRun=false, reloads=false, dateChange=false;
  String matriculai,resultadoCovid,fechaPositivoCE='',fechaNegativoCE='', idCovi;
  String _resultadoCovidfinal;
  String _date = "No establecido";
  String _time = "No establecido";
  String dateAndTime, _timeStringDB;
  String _day, _month,_year, _hours,_second, _minute;
  DataBaseHelperUser _helperUser = new DataBaseHelperUser();

  loadResultado()async{
    try{
      var safe = await _helperUser.getResulCovid();
      Map<String, dynamic> map = safe;
      List<dynamic> data = map["data"];
      idCovi=(data[0]["idCov"].toString());
      matriculai=(data[0]["matriculai"].toString());
      resultadoCovid=(data[0]["resultadoCovid"].toString());
      fechaPositivoCE=(data[0]["fechaPositivoCE"].toString());
      fechaNegativoCE=(data[0]["fechaNegativoCE"].toString());
      if(fechaPositivoCE=='null'){
        fechaPositivoCE='';
      }
      if(fechaNegativoCE=='null'){
        fechaNegativoCE='';
      }
      if(firstRun==false){
        setState(() {
          if(resultadoCovid=='1'){
            switchValue=true;
          }else{
            switchValue= false;
          }
        });
        firstRun=true;
      }
      if(reloads==true){
        setState(() {
          if(resultadoCovid=='1'){
            switchValue=true;
          }else{
            switchValue= false;
          }
        });
        reloads=false;
      }
      print('me ejecute');
      hola = true;
    }catch(e){
      print(e);
    }
  }

  @override
  void initState(){
    this.loadResultado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi resultado Covid-19'),
        backgroundColor: Color(0xff3F005C),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.width *.025,
            ),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("Estado Covid-19"),
                CupertinoSwitch(
                  value: switchValue,
                  onChanged: (changedValue) {
                    AlertDialog alertDialog = new AlertDialog(
                      content: new Text("Estas seguro de cambiar tu estado, ten en cuenta que tus compañeros de grupo serán notificados"),
                      actions: <Widget>[
                        new RaisedButton(
                          child: new Text("OK",style: new TextStyle(color: Colors.white),),
                          color: Colors.red,
                          onPressed: (){
                            if(dateChange==true){
                              if(_date!='No establecido' && _time!='No establecido'){
                                _timeStringDB=('$_year-$_month-$_day $_hours:$_minute:$_second');
                                print('ambos cambian $_timeStringDB');
                                _resultadoCovidfinal='1';
                                _helperUser.editarCovid(idCovi,matriculai,_resultadoCovidfinal,_timeStringDB,fechaNegativoCE);
                                _helperUser.sendNotification(matriculai);
                                //si all sale bien
                                switchValue = changedValue;
                                setState(() {
                                  switchValue = changedValue;
                                });
                                print('despues de $switchValue');
                                Navigator.pop(context);
                              }
                            }else{
                              //si la fecha es por default
                              _getTime();
                              //si all sale bien
                              _resultadoCovidfinal='1';
                              _helperUser.editarCovid(idCovi,matriculai,_resultadoCovidfinal,_timeStringDB,fechaNegativoCE);
                              _helperUser.sendNotification(matriculai);
                              switchValue = changedValue;
                              setState(() {
                                switchValue = changedValue;
                              });
                              print('despues de $switchValue');
                              Navigator.pop(context);
                            }
                          },
                        ),
                        new RaisedButton(
                          child: new Text("CANCELAR",style: new TextStyle(color: Colors.white)),
                          color: Colors.green,
                          onPressed: ()=> Navigator.pop(context),
                        ),
                      ],
                    );
                    print(switchValue);
                    //para dar de alta como positivo
                    if(switchValue==false){
                      if(dateChange==true){
                        if(_date!='No establecido' && _time!='No establecido'){
                          showDialog(context: context, child: alertDialog);
                        }else{
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Alerta'),
                              content: Text('Termine de definir la fecha'),
                            ),
                          );
                        }
                      }else{
                        showDialog(context: context, child: alertDialog);
                      }
                    }else if(switchValue==true){
                      //para dar como negativo
                      if(dateChange==true){
                        if(_date!='No establecido' && _time!='No establecido'){
                          _timeStringDB=('$_year-$_month-$_day $_hours:$_minute:$_second');
                          print('ambos cambian $_timeStringDB');
                          _resultadoCovidfinal='0';
                          _helperUser.editarCovid(idCovi,matriculai,_resultadoCovidfinal,fechaPositivoCE,_timeStringDB);
                          print('soy true');
                          setState(() {
                            switchValue = changedValue;
                          });
                        }else{
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Alerta'),
                              content: Text('Termine de definir la fecha'),
                            ),
                          );
                        }
                      }else{
                        _getTime();
                        //si all sale bien
                        _resultadoCovidfinal='0';
                        _helperUser.editarCovid(idCovi,matriculai,_resultadoCovidfinal,fechaPositivoCE,_timeStringDB);
                        print('soy true');
                        setState(() {
                          switchValue = changedValue;
                        });
                      }
                    }
                  },
                ),
              ],
            ),
            new FutureBuilder(
                future: loadResultado(),
                builder: (context, snapshot) {
                  return hola==true ? new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new SizedBox(
                        height: 13.0,
                      ),
                      new SizedBox(
                        height: 13.0,
                      ),
                      new RichText(
                        text: new TextSpan(
                          text: '   Fecha positivo:         ',
                          style: TextStyle(color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: height / 50), /*defining default style is optional */
                          children: <TextSpan>[
                            new TextSpan(
                                text: fechaPositivoCE, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: height / 50)),
                          ],
                        ),
                      ),
                      new SizedBox(
                        height: 13.0,
                      ),
                      new RichText(
                        text: new TextSpan(
                          text: '   Fecha negativo:        ',
                          style: TextStyle(color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: height / 50), /*defining default style is optional */
                          children: <TextSpan>[
                            new TextSpan(
                                text: fechaNegativoCE, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: height / 50)),
                          ],
                        ),
                      ),
                    ],
                  ): new Center(
                    child: new CircularProgressIndicator(),
                  );
                }
            ),
            SizedBox(
              height: size.width *.09,
            ),
            Text('Seleciona la fecha y hora para cambio',
              textAlign: TextAlign.left,
              style: new TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(1.7),
                  fontWeight: FontWeight.bold,
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
                    minTime: DateTime(2019, 1, 1),
                    maxTime: DateTime(2032, 12, 31), onConfirm: (date) {
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
                      dateChange=true;
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
                      dateChange=true;
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
            Center(
              child: Text('Si no se ha seleccionado una fecha al cambiar el estado, se utilizara la fecha y hora actual (tanto como para dar postivo como negativo)',
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(1.2),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTimeBD = _formatDateTimeBD(now);
    _timeStringDB = formattedDateTimeBD;
  }

  String _formatDateTimeBD(DateTime dateTime) {
    _year='${dateTime.year}';
    if(dateTime.month<10){
      _month='0${dateTime.month}';
    }else{
      _month='${dateTime.month}';
    }
    if(dateTime.day<10){
      _day='0${dateTime.day}';
    }else{
      _day='${dateTime.day}';
    }
    if(dateTime.hour<10){
      _hours='0${dateTime.hour}';
    }else{
      _hours='${dateTime.hour}';
    }
    if(dateTime.minute<10){
      _minute='0${dateTime.minute}';
    }else{
      _minute='${dateTime.minute}';
    }
    if(dateTime.second<10){
      _second='0${dateTime.second}';
    }else{
      _second='${dateTime.second}';
    }
    //print('${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour}:${dateTime.minute}:${dateTime.second}');
    return '$_year-$_month-$_day $_hours:$_minute:$_second';
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