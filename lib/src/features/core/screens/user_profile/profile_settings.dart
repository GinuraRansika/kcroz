import 'dart:typed_data';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kcroz/src/features/core/screens/user_profile/edit_profile.dart';
import 'package:kcroz/src/features/core/screens/user_profile/settings_page.dart';
import 'package:kcroz/src/features/core/screens/user_profile/user_profile_screen.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../utils/utils.dart';
import 'profile_bio.dart';
import 'profile_interests.dart';
import 'profile_settings.dart';
import 'user_profile_screen.dart';
import 'package:provider/provider.dart';
import 'additional_step.dart';

import '../../../../constants/text_string.dart';


class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {

  bool _isNotificationsEnabled = true;
  bool _isAppNotificationsEnabled = true;
  bool _isPrivateAccountEnabled = false;


  @override
  Widget build(BuildContext context) {
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
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
                        fontSize: 18,
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
                  child: const Text('Add Account'),
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
                  child: const Text('Switch Account'),
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
                  child: const Text('Delete Account'),
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
                  title: const Text('Notifications',
                    style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Sans-serif',),
                  ),
                  activeColor: Colors.purple,
                  inactiveTrackColor: Colors.grey,
                  value: _isNotificationsEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _isNotificationsEnabled = value;
                    });
                  },
                ),

                SwitchListTile(
                  title: const Text('App Notifications',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),
                  ),
                  activeColor: Colors.purple,
                  inactiveTrackColor: Colors.grey,
                  value: _isAppNotificationsEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _isAppNotificationsEnabled = value;
                    });
                  },
                ),


                Divider(thickness: 0,),

                Row(
                  children: const [
                    Icon(Icons.privacy_tip_rounded),
                    SizedBox(width: 10),
                    Text('Privacy', style: TextStyle(
                      fontSize: 25,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ],
                ),

                Divider(thickness: 4,),

                SwitchListTile(
                  title: const Text('Private Account',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),
                  ),
                  activeColor: Colors.purple,
                  inactiveTrackColor: Colors.grey,
                  value: _isPrivateAccountEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _isPrivateAccountEnabled = value;
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
              ]),
        ),
    );
  }
}


