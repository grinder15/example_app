import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.redAccent,
        scaffoldBackgroundColor: Color(0xfff5f5f5),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

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

class AlarmListItem extends StatelessWidget {
  const AlarmListItem({
    Key key,
    @required this.time,
    @required this.timeRemaining,
    @required this.type,
    @required this.icon,
    @required this.color,
    @required this.heroTag,
    this.onTap,
    this.title,
    this.elevation = 0.0,
  }) : super(key: key);

  final String time;
  final String timeRemaining;
  final String title;
  final String type;
  final IconData icon;
  final Color color;
  final double elevation;
  final String heroTag;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Hero(
      tag: heroTag,
      child: Material(
        color: Colors.white,
        elevation: elevation,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 16.0,
              bottom: 16.0,
              right: 8.0,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 52.0,
                      height: 52.0,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        icon,
                        size: 24.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            time,
                            style: TextStyle(
                              fontSize: 52.0,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            'In $timeRemaining',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert),
                      color: Colors.grey,
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    SizedBox(width: 62.0),
                    if (title != null)
                      Text(
                        title,
                        style: theme.textTheme.subtitle1.copyWith(
                          color: Colors.blueGrey,
                        ),
                      ),
                    if (title != null) SizedBox(width: 4.0),
                    Text(
                      type,
                      style: theme.textTheme.subtitle1.copyWith(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage();

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
                MaterialPageRoute(
                  builder: (context) => AlarmDetailsPage(
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
                MaterialPageRoute(
                  builder: (context) => AlarmDetailsPage(
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
                MaterialPageRoute(
                  builder: (context) => AlarmDetailsPage(
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
