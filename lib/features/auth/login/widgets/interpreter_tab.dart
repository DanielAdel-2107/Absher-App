import 'package:flutter/material.dart';

class InterpreterTap extends StatelessWidget {
  const InterpreterTap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.8,
      child: Tab(
        child: Text('مفسر'),
      ),
    );
  }
}
