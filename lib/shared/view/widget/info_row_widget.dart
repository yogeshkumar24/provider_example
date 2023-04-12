import 'package:flutter/material.dart';

class InfoRawWidget extends StatelessWidget {
  final String title;
  final String value;

  const InfoRawWidget({required this.title, required this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}
