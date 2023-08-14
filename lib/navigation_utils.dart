import 'package:flutter/material.dart';

void goToNextScreen(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (c) => widget),
  );
}
