import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateOptionWidget extends StatelessWidget {
  final DateTime date;

  const DateOptionWidget({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat("dd MMM yy 'às' HH:mm").format(date);

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Text(
        formattedDate,
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }
}
