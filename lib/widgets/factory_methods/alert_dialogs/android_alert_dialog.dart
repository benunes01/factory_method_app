import 'package:factory_method_app/widgets/factory_methods/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AndroidAlertDialog extends CustomDialog {
  @override
  String getTitle() {
    return "Android Alert Dialog";
  }

  @override
  Widget create(BuildContext context) {
    return AlertDialog(
      title: Text(getTitle()),
      content: Text("This is the material-style alert dialog!"),
      actions: <Widget>[
        FlatButton(
          child: Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}