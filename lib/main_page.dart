import 'package:flutter/material.dart';

import 'day_header.dart';
import 'alarm_list_item.dart';
import 'alarm_details_page.dart';

class MainPage extends StatelessWidget {
  Route _buildPageRouteToDetails({@required Widget page}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarms'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 48.0,
                ),
              ),
              accountName: Text('Jerome Arenas'),
              accountEmail: Text('jerome.arenas@mylogoinc.com'),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          DayHeader(
            dayName: 'Tomorrow',
          ),
          AlarmListItem(
            heroTag: 'item_1',
            time: '07:00',
            timeRemaining: '16 hours',
            type: 'EVERY DAY',
            icon: Icons.alarm,
            color: Colors.orange,
            onTap: () {
              Navigator.push(
                context,
                _buildPageRouteToDetails(
                  page: AlarmDetailsPage(
                    heroTag: 'item_1',
                    time: '07:00',
                    timeRemaining: '16 hours',
                    day: 'Tomorrow',
                    type: 'EVERY DAY',
                    icon: Icons.alarm,
                    color: Colors.orange,
                  ),
                ),
              );
            },
          ),
          Divider(
            thickness: 0.5,
            height: 1.0,
          ),
          AlarmListItem(
            heroTag: 'item_2',
            time: '18:15',
            timeRemaining: 'In 1 day',
            title: "Friend's birthday",
            type: 'ONE TIME',
            icon: Icons.card_giftcard,
            color: Colors.blueAccent,
            onTap: () {
              Navigator.push(
                context,
                _buildPageRouteToDetails(
                  page: AlarmDetailsPage(
                    heroTag: 'item_2',
                    time: '18:15',
                    timeRemaining: 'In 1 day',
                    title: "Friend's birthday",
                    type: 'ONE TIME',
                    icon: Icons.card_giftcard,
                    color: Colors.blueAccent,
                    day: 'Tomorrow',
                  ),
                ),
              );
            },
          ),
          DayHeader(
            dayName: 'Saturday',
          ),
          AlarmListItem(
            heroTag: 'item_3',
            time: '08:30',
            timeRemaining: 'In 3 days',
            title: "Weekends",
            type: 'SAT, SUN',
            icon: Icons.local_cafe,
            color: Colors.green,
            onTap: () {
              Navigator.push(
                context,
                _buildPageRouteToDetails(
                  page: AlarmDetailsPage(
                    heroTag: 'item_3',
                    time: '08:30',
                    timeRemaining: 'In 3 days',
                    title: "Weekends",
                    type: 'SAT, SUN',
                    icon: Icons.local_cafe,
                    color: Colors.green,
                    day: 'Saturday',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
