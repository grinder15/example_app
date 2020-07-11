import 'package:flutter/material.dart';

import 'alarm_list_item.dart';

class AlarmDetailsPage extends StatelessWidget {
  const AlarmDetailsPage({
    Key key,
    @required this.time,
    @required this.timeRemaining,
    @required this.day,
    @required this.type,
    @required this.icon,
    @required this.color,
    @required this.heroTag,
    this.title,
  }) : super(key: key);

  final String time;
  final String timeRemaining;
  final String title;
  final String type;
  final IconData icon;
  final Color color;
  final String heroTag;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(day),
        backgroundColor: color,
      ),
      body: ListView(
        children: [
          AlarmListItem(
            time: time,
            timeRemaining: timeRemaining,
            title: title,
            type: type,
            icon: icon,
            color: color,
            elevation: 4.0,
            heroTag: heroTag,
          ),
        ],
      ),
    );
  }
}
