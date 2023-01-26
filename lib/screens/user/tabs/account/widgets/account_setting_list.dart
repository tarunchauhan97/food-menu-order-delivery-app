import 'package:flutter/material.dart';

class AccountSettingList extends StatelessWidget {
  final IconData icon;
  final String iconText;
  const AccountSettingList({
    Key? key,
    required this.icon,
    required this.iconText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.grey.shade300,
      ))),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 25.0,
            color: Theme.of(context).primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Text(
              iconText,
              style: const TextStyle(fontSize: 18.0),
            ),
          )
        ],
      ),
    );
  }
}
