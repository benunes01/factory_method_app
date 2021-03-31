import 'package:factory_method_app/widgets/factory_methods/alert_dialogs/android_alert_dialog.dart';
import 'package:factory_method_app/widgets/factory_methods/alert_dialogs/ios_alert_dialog.dart';
import 'package:factory_method_app/widgets/factory_methods/custom_dialog.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Factory Method',
      home: FactoryMethodExample(),
    );
  }
}

class FactoryMethodExample extends StatefulWidget {
  @override
  _FactoryMethodExampleState createState() => _FactoryMethodExampleState();
}

class _FactoryMethodExampleState extends State<FactoryMethodExample> {
  final List<CustomDialog> customDialogList = [
    AndroidAlertDialog(),
    IosAlertDialog(),
  ];

  int _selectedDialogIndex = 0;

  Future _showCustomDialog(BuildContext context) async {
    var selectedDialog = customDialogList[_selectedDialogIndex];

    await selectedDialog.show(context);
  }

  void _setSelectedDialogIndex(int index) {
    setState(() {
      _selectedDialogIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          DialogSelection(
            dialogIndex: _selectedDialogIndex,
            customDialogList: customDialogList,
            onChanged: _setSelectedDialogIndex,
          ),
          RaisedButton(
            child: Text(customDialogList.elementAt(_selectedDialogIndex).getTitle()),
            onPressed: () => _showCustomDialog(context),
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class DialogSelection extends StatelessWidget {
  final int dialogIndex;
  final List<CustomDialog> customDialogList;
  final ValueSetter<int> onChanged;

  const DialogSelection({
    @required this.dialogIndex,
    @required this.customDialogList,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: <Widget>[
          for (var i = 0; i < customDialogList.length; i++)
            RadioListTile(
              title: Text(customDialogList.elementAt(i).getTitle()),
              value: i,
              groupValue: dialogIndex,
              selected: i == dialogIndex,
              activeColor: Colors.black,
              controlAffinity: ListTileControlAffinity.platform,
              onChanged: onChanged,
            ),
        ],
      )
    );
  }
}
