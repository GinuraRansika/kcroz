import 'package:flutter/material.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isNotificationsEnabled = true;
  bool _isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Notifications'),
            value: _isNotificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _isNotificationsEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Dark Mode'),
            value: _isDarkModeEnabled,
            onChanged: (bool value) {
              setState(() {
                _isDarkModeEnabled = value;
              });
            },
          ),
        ],
      ),
    );
  }

}