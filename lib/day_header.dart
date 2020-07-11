import 'package:flutter/material.dart';

class DayHeader extends StatelessWidget {
  const DayHeader({
    Key key,
    this.dayName,
  }) : super(key: key);

  final String dayName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 10.0,
      ),
      child: Text(
        dayName,
        style: Theme.of(context).textTheme.subtitle1.copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
