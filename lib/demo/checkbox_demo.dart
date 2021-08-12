import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({Key? key}) : super(key: key);

  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _checkBoxItemA = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CheckboxDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CheckboxListTile(
                value: _checkBoxItemA,
                onChanged: (value) {
                  setState(() {
                    _checkBoxItemA = value!;
                  });
                },
                title: Text('CheckboxListTile'),
                subtitle: Text('Description'),
                secondary: Icon(Icons.book),
                // 标题是否处于激活状态
                selected: _checkBoxItemA,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Checkbox(
                  //   value: _checkBoxItemA,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       _checkBoxItemA = value!;
                  //     });
                  //   },
                  //   activeColor: Colors.black,
                  // )
                ],
              ),
            ],
          ),
        ));
  }
}
