import 'package:flutter/material.dart';
import 'package:mvvm/widgets/loading_widget.dart';

class LoadingDialog {
  static void showLoading(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Loading();
        },
      );
    });
  }

  static void dismissLoading(BuildContext context) {
    Navigator.of(context).pop();
  }
}
