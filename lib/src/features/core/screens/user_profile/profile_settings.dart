import 'dart:typed_data';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kcroz/src/features/authentication/screens/screens/signup/signup_screen.dart';
import 'package:kcroz/src/features/core/screens/user_profile/edit_profile.dart';
import 'package:kcroz/src/features/core/screens/user_profile/language_settings.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../utils/utils.dart';
import '../profile/update_profile_screen.dart';
import 'profile_bio.dart';
import 'profile_interests.dart';
import 'profile_settings.dart';

import 'package:provider/provider.dart';
import 'profile_feed.dart';

import '../../../../constants/text_string.dart';


class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {

  bool _isRequestsNotificationsEnabled = true;
  bool _isMessagesNotificationsEnabled = true;
  bool _isCallsAccountEnabled = true;
  bool _isDarkModeEnabled = false;

  final ThemeData _lightTheme = ThemeData(
    primarySwatch: Colors.purple,
    brightness: Brightness.light,
  );

  final ThemeData _darkTheme = ThemeData(
    primarySwatch: Colors.deepPurple,
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return
      // MaterialApp(
      // theme: _isDarkModeEnabled ? _darkTheme : _lightTheme,
      // home:
      Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(kcrozProfileSettings, style: Theme.of(context).textTheme.headline4,),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.done_sharp))
        ],

      ),

        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [

                Row(
                  children: const [
                    Icon(Icons.account_circle),
                    SizedBox(width: 10),
                    Text('Account', style: TextStyle(
                      fontSize: 25,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ],
                ),

                Divider(thickness: 4,),

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UpdateProfileScreen()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.transparent, width: 2.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),

                    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
                    alignment: Alignment.centerLeft,

                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sans-serif',
                      ),
                    ),
                  ),
                  child: const Text('Edit Profile'),
                ),

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.transparent, width: 2.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),

                    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
                    alignment: Alignment.centerLeft,

                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sans-serif',
                      ),
                    ),
                  ),
                  child: const Text('Add Account'),
                ),

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LanguageSettings()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.transparent, width: 2.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),

                    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
                    alignment: Alignment.centerLeft,

                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sans-serif',
                      ),
                    ),
                  ),
                  child: const Text('Language'),
                ),

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.transparent, width: 2.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),

                    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
                    alignment: Alignment.centerLeft,

                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sans-serif',
                      ),
                    ),
                  ),
                  child: const Text('Manage Interests'),
                ),


                Divider(thickness: 0,),

                Row(
                  children: const [
                    Icon(Icons.notifications_active_rounded),
                    SizedBox(width: 10),
                    Text('Notification',
                      style: TextStyle(
                      fontSize: 25,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ],
                ),

                Divider(thickness: 4,),

                SwitchListTile(
                  title: const Text('Requests',
                    style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Sans-serif',),
                  ),
                  activeColor: Colors.purple,
                  inactiveTrackColor: Colors.grey,
                  value: _isRequestsNotificationsEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _isRequestsNotificationsEnabled = value;
                    });
                  },
                ),

                SwitchListTile(
                  title: const Text('Messages',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),
                  ),
                  activeColor: Colors.purple,
                  inactiveTrackColor: Colors.grey,
                  value: _isMessagesNotificationsEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _isMessagesNotificationsEnabled = value;
                    });
                  },
                ),

                SwitchListTile(
                  title: const Text('Calls',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),
                  ),
                  activeColor: Colors.purple,
                  inactiveTrackColor: Colors.grey,
                  value: _isCallsAccountEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _isCallsAccountEnabled = value;
                    });
                  },
                ),


                Divider(thickness: 0,),

                Row(
                  children: const [
                    Icon(Icons.dark_mode_rounded),
                    SizedBox(width: 10),
                    Text('Display', style: TextStyle(
                      fontSize: 25,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ],
                ),

                Divider(thickness: 4,),

                SwitchListTile(
                  title: const Text('Dark',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),
                  ),
                  activeColor: Colors.purple,
                  inactiveTrackColor: Colors.grey,
                  value: _isDarkModeEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _isDarkModeEnabled = !_isDarkModeEnabled;
                      // _isDarkModeEnabled = value;
                    });
                  },
                ),

                Divider(thickness: 0,),

                Row(
                  children: const [
                    Icon(Icons.security_rounded),
                    SizedBox(width: 10),
                    Text('Security', style: TextStyle(
                      fontSize: 25,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ],
                ),

                Divider(thickness: 4,),

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.transparent, width: 2.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),

                    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
                    alignment: Alignment.centerLeft,

                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sans-serif',
                      ),
                    ),
                  ),
                  child: const Text('Change Password'),
                ),

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.transparent, width: 2.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),

                    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
                    alignment: Alignment.centerLeft,

                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sans-serif',
                      ),
                    ),
                  ),
                  child: const Text('Security Checkup'),
                ),

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.transparent, width: 2.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),

                    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
                    alignment: Alignment.centerLeft,

                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sans-serif',
                      ),
                    ),
                  ),
                  child: const Text('Login Activity'),
                ),


                Divider(thickness: 0,),

                Row(
                  children: const [
                    Icon(Icons.info_rounded),
                    SizedBox(width: 10),
                    Text('About', style: TextStyle(
                      fontSize: 25,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ],
                ),

                Divider(thickness: 4,),

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.transparent, width: 2.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),

                    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
                    alignment: Alignment.centerLeft,

                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sans-serif',
                      ),
                    ),
                  ),
                  child: const Text('Privacy Policy'),
                ),

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.transparent, width: 2.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),

                    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
                    alignment: Alignment.centerLeft,

                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sans-serif',
                      ),
                    ),
                  ),
                  child: const Text('Terms of Use'),
                ),

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.transparent, width: 2.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),

                    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
                    alignment: Alignment.centerLeft,

                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sans-serif',
                      ),
                    ),
                  ),
                  child: const Text('Open source libraries'),
                ),


                Divider(thickness: 0,),

                Row(
                  children: const [
                    Icon(Icons.help_rounded),
                    SizedBox(width: 10),
                    Text('Help', style: TextStyle(
                      fontSize: 25,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ],
                ),

                Divider(thickness: 4,),

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.transparent, width: 2.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),

                    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
                    alignment: Alignment.centerLeft,

                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sans-serif',
                      ),
                    ),
                  ),
                  child: const Text('Report a Problem'),
                ),

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.transparent, width: 2.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),

                    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
                    alignment: Alignment.centerLeft,

                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sans-serif',
                      ),
                    ),
                  ),
                  child: const Text('Account Status'),
                ),

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.transparent, width: 2.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),

                    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
                    alignment: Alignment.centerLeft,

                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sans-serif',
                      ),
                    ),
                  ),
                  child: const Text('Help Center'),
                ),

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.transparent, width: 2.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),

                    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
                    alignment: Alignment.centerLeft,

                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sans-serif',
                      ),
                    ),
                  ),
                  child: const Text('Privacy and Security Help'),
                ),

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.transparent, width: 2.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),

                    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
                    alignment: Alignment.centerLeft,

                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sans-serif',
                      ),
                    ),
                  ),
                  child: const Text('Support Requests'),
                ),


                Divider(thickness: 0,),

                Row(
                  children: const [
                    Icon(Icons.logout_rounded),
                    SizedBox(width: 10),
                    Text('Account Actions', style: TextStyle(
                      fontSize: 25,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ],
                ),

                Divider(thickness: 4,),

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.transparent, width: 2.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),

                    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
                    alignment: Alignment.centerLeft,

                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sans-serif',
                      ),
                    ),
                  ),
                  child: const Text('Delete Account'),
                ),

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.transparent, width: 2.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),

                    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
                    alignment: Alignment.centerLeft,

                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sans-serif',
                      ),
                    ),
                  ),
                  child: const Text('Log Out'),
                ),


              ]),
        ),
    // ),
    );
  }
}


