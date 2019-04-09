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
  String _value = 'New Value from Variable';
  String _dateNow = '';

  String _message = '';

  int _jumlah = 0;

  void _onPressed() {
    setState(() {
      _value = 'My Name is Jaki';
    });
  }

  void _onPressedAgain(String value) {
    setState(() {
      _value = value;
    });
  }

  void _onPressedFlatButton() {
    setState(() {
      _dateNow = DateTime.now().toString();
    });
  }

  void _add() {
    setState(() {
      _jumlah++;
    });
  }

  void _substract() {
    setState(() {
      _jumlah--;
    });
  }

  void _onChange(String value) {
    setState(() => _message = 'Changed : $value');
  }

  void _onSubmit(String value) {
    setState(() => _message = 'Submited : $value');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text(_value),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text(_value),
            new Text(_dateNow),
            new Text('Nilainya adalah $_jumlah'),
            new Text(_message),
            new RaisedButton(
              onPressed: _onPressed,
              child: new Text('Click Me'),
            ),
            new RaisedButton(
              onPressed: () => _onPressedAgain('Hello Bryan'),
              child: new Text('Click Me Again'),
            ),
            new FlatButton(
                onPressed: _onPressedFlatButton,
                child: new Text('Click Flat Button')),
            new IconButton(icon: Icon(Icons.add), onPressed: _add),
            new IconButton(icon: Icon(Icons.remove), onPressed: _substract),
            new TextField(
              decoration: new InputDecoration(
                labelText: 'Hello',
                hintText: 'Input your message',
                icon: new Icon(Icons.people)
              ),
              autofocus: true,
              keyboardType: TextInputType.number,
              onChanged: _onChange,
              onSubmitted: _onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}
