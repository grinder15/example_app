import 'package:flutter/material.dart';

class AlarmListItem extends StatefulWidget {
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
  _AlarmListItemState createState() => _AlarmListItemState();
}

class _AlarmListItemState extends State<AlarmListItem> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Hero(
      tag: widget.heroTag,
      child: Material(
        color: Colors.white,
        elevation: widget.elevation,
        child: InkWell(
          onTap: widget.onTap,
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
                        color: widget.color,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        widget.icon,
                        size: 24.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            widget.time,
                            style: TextStyle(
                              fontSize: 52.0,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            'In ${widget.timeRemaining}',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: _isOn,
                      onChanged: (value) {
                        setState(() => _isOn = value);
                      },
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
                    if (widget.title != null)
                      Text(
                        widget.title,
                        style: theme.textTheme.subtitle1.copyWith(
                          color: Colors.blueGrey,
                        ),
                      ),
                    if (widget.title != null) SizedBox(width: 4.0),
                    Text(
                      widget.type,
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
