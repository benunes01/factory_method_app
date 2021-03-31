import 'package:factory_method_app/widgets/factory_methods/custom_dialog.dart';
import 'package:flutter/cupertino.dart';

class IosAlertDialog extends CustomDialog {

  @override
  String getTitle() {
    return "IOS Alert Dialog";
  }

  @override
  Widget create(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(getTitle()),
      content: Text("This is the cupertino-style alert dialog!"),
      actions: <Widget>[
        CupertinoButton(
          child: Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}