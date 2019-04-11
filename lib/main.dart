import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _value = 'Default Value from Variable';

  /* Tanpa Parameter */
  void _onPressed() {
    setState(() {
      _value = 'My Name is Jaki';
    });
  }

  /* Parameter */
  void _onPressedAgain(String value) {
    setState(() {
      _value = value;
    });
  }

  /* Edit Text */
  String _message = '';

  void _onChange(String value) {
    setState(() => _message = 'Changed : $value');
  }

  void _onSubmit(String value) {
    setState(() => _message = 'Submited : $value');
  }

  /* Flat Button */
  String _dateNow = '';

  void _onPressedFlatButton() {
    setState(() {
      _dateNow = DateTime.now().toString();
    });
  }

  /* Icon Button */
  int _jml = 0;

  void _add() {
    setState(() {
      _jml++;
    });
  }

  void _substract() {
    setState(() {
      _jml--;
    });
  }

  /* Checkbox */
  bool _pilih1 = false;
  bool _pilih2 = false;

  void _pilih1Change(bool value) => setState(() => _pilih1 = value);

  void _pilih2Change(bool value) => setState(() => _pilih2 = value);

  /* Slider */
  double _sliderValue = 0.0;

  void _setSliderValue(double value) => setState(() => _sliderValue = value);

  /* Date Picker */
  String _dateValue = '';

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2020));

    if (picked != null) setState(() => _dateValue = picked.toString());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text('Flutter Basic App'),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.add), onPressed: _add),
          new IconButton(icon: Icon(Icons.remove), onPressed: _substract)
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _onPressedFlatButton,
        backgroundColor: Colors.redAccent,
        mini: true,
        child: new Icon(Icons.timer),
      ),
      drawer: new Drawer(
        child: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new Text('Hello Drawer'),
              new RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: new Text('Close'),
              )
            ],
          ),
        ),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text(_value),

            /* Tanpa Parameter */
            new RaisedButton(
              onPressed: _onPressed,
              child: new Text('Click Me'),
            ),

            /* Parameter */
            new RaisedButton(
              onPressed: () => _onPressedAgain('Hello Bryan'),
              child: new Text('Click Me Again'),
            ),

            /* Flat Button */
            new FlatButton(
                onPressed: _onPressedFlatButton,
                child: new Text('Click Flat Button')),
            new Text(_dateNow),

            /* Icon Button */
            new IconButton(icon: Icon(Icons.add), onPressed: _add),
            new Text(
              'Nilainya adalah $_jml',
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 37.0),
            ),
            new IconButton(icon: Icon(Icons.remove), onPressed: _substract),

            /* Edit Text */
            new Text(_message),
            new TextField(
              decoration: new InputDecoration(
                  labelText: 'Hello',
                  hintText: 'Input your message',
                  icon: new Icon(Icons.people)),
              autofocus: true,
              keyboardType: TextInputType.text,
              onChanged: _onChange,
              onSubmitted: _onSubmit,
            ),

            /* Checbox*/
            new Checkbox(
                value: _pilih1,
                onChanged: _pilih1Change,
                activeColor: Colors.amberAccent),
            new CheckboxListTile(
              value: _pilih2,
              onChanged: _pilih2Change,
              title: new Text('CheckboxListTile'),
              subtitle: new Text('Sub Title'),
              secondary: new Icon(Icons.archive),
              activeColor: Colors.red,
              controlAffinity: ListTileControlAffinity.trailing,
            ),

            /* Slider */
            new Text('Value Slider : ${(_sliderValue * 100).round()}'),
            new Slider(value: _sliderValue, onChanged: _setSliderValue),

            /* Date Picker */
            new Text(_dateValue),
            new RaisedButton(
              onPressed: _selectDate,
              child: new Text('Select Date!'),
            ),
          ],
        ),
      ),
    );
  }
}
