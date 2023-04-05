import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcroz/src/features/authentication/screens/screens/signup/signup_screen.dart';

import '../profile/update_profile_screen.dart';
import '../user_profile/edit_profile.dart';
import '../user_profile/language_settings.dart';

class SideSettings extends StatefulWidget{
  const SideSettings({super.key});

  @override
  State<SideSettings> createState() => _SideSettingsState();
}

class _SideSettingsState extends State<SideSettings>{

  bool _isRequestsNotificationsEnabled = true;
  bool _isMessagesNotificationsEnabled = true;
  bool _isCallsAccountEnabled = true;
  bool _isDarkModeEnabled = false;


  @override
  Widget build (BuildContext context){
    return Scaffold(
      body:

        Container(
          width: 288,
          height: double.infinity,
          color: Color(0xFF172034),
          child: SafeArea(
            child: Column(
              children: [
                const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: Icon(
                      CupertinoIcons.settings,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    "Settings",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                Padding(padding: EdgeInsets.only(top: 32,bottom: 16),
                child: Text(
                  "Account".toUpperCase(),
                  style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white70),
                ),
                ),

                Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 24),
                      child: Divider(
                        color: Colors.white24,
                        height: 1,
                      ),
                    ),
                    Stack(
                      children: [
                        Positioned(
                          height: 56,
                          width: 288,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xFF966FD6),
                                borderRadius: BorderRadius.all(Radius.circular(25))
                          ),),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfileScreen()),);
                          },
                          leading: const SizedBox(
                            height: 34,
                            width: 34,
                            child: Icon(Icons.edit,
                            color: Colors.white,),
                          ),
                          title: const Text(
                            "Edit Profile",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),

                    Stack(
                      children: [
                        Positioned(
                          height: 56,
                          width: 288,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xFF966FD6),
                                borderRadius: BorderRadius.all(Radius.circular(25))
                            ),),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()),);
                          },
                          leading: const SizedBox(
                            height: 34,
                            width: 34,
                            child: Icon(Icons.add_box_rounded,
                              color: Colors.white,),
                          ),
                          title: const Text(
                            "Add Account",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),

                    Stack(
                      children: [
                        Positioned(
                          height: 56,
                          width: 288,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xFF966FD6),
                                borderRadius: BorderRadius.all(Radius.circular(25))
                            ),),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LanguageSettings()),);
                          },
                          leading: const SizedBox(
                            height: 34,
                            width: 34,
                            child: Icon(Icons.language_rounded,
                              color: Colors.white,),
                          ),
                          title: const Text(
                            "Language",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),

                    Stack(
                      children: [
                        Positioned(
                          height: 56,
                          width: 288,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xFF966FD6),
                                borderRadius: BorderRadius.all(Radius.circular(25))
                            ),),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()),);
                          },
                          leading: const SizedBox(
                            height: 34,
                            width: 34,
                            child: Icon(Icons.manage_accounts,
                              color: Colors.white,),
                          ),
                          title: const Text(
                            "Manage Interests",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),


                  ],
                ),


                Padding(padding: EdgeInsets.only(top: 32,bottom: 16),
                  child: Text(
                    "Notification".toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white70),
                  ),
                ),

                Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 24),
                      child: Divider(
                        color: Colors.white24,
                        height: 1,
                      ),
                    ),
                    SwitchListTile(
                      title: const Text('Requests',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans-serif',),
                      ),
                      activeColor: Color(0xFF966FD6),
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans-serif',),
                      ),
                      activeColor: Color(0xFF966FD6),
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans-serif',),
                      ),
                      activeColor: Color(0xFF966FD6),
                      inactiveTrackColor: Colors.grey,
                      value: _isCallsAccountEnabled,
                      onChanged: (bool value) {
                        setState(() {
                          _isCallsAccountEnabled = value;
                        });
                      },
                    ),


                  ],
                ),

                Padding(padding: EdgeInsets.only(top: 32,bottom: 16),
                  child: Text(
                    "Display".toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white70),
                  ),
                ),

                Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 24),
                      child: Divider(
                        color: Colors.white24,
                        height: 1,
                      ),
                    ),
                    SwitchListTile(
                      title: const Text('Dark',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans-serif',),
                      ),
                      activeColor: Color(0xFF966FD6),
                      inactiveTrackColor: Colors.grey,
                      value: _isDarkModeEnabled,
                      onChanged: (bool value) {
                        setState(() {
                          _isDarkModeEnabled = !_isDarkModeEnabled;
                          // _isDarkModeEnabled = value;
                        });
                      },
                    ),


                  ],
                ),


                Padding(padding: EdgeInsets.only(top: 32,bottom: 16),
                  child: Text(
                    "Security".toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white70),
                  ),
                ),

                Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 24),
                      child: Divider(
                        color: Colors.white24,
                        height: 1,
                      ),
                    ),
                    Stack(
                      children: [
                        Positioned(
                          height: 56,
                          width: 288,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xFF966FD6),
                                borderRadius: BorderRadius.all(Radius.circular(25))
                            ),),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()),);
                          },
                          leading: const SizedBox(
                            height: 34,
                            width: 34,
                            child: Icon(Icons.change_circle_rounded,
                              color: Colors.white,),
                          ),
                          title: const Text(
                            "Change Password",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),

                    Stack(
                      children: [
                        Positioned(
                          height: 56,
                          width: 288,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xFF966FD6),
                                borderRadius: BorderRadius.all(Radius.circular(25))
                            ),),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LanguageSettings()),);
                          },
                          leading: const SizedBox(
                            height: 34,
                            width: 34,
                            child: Icon(Icons.language_rounded,
                              color: Colors.white,),
                          ),
                          title: const Text(
                            "Language",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),

                    Stack(
                      children: [
                        Positioned(
                          height: 56,
                          width: 288,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xFF966FD6),
                                borderRadius: BorderRadius.all(Radius.circular(25))
                            ),),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()),);
                          },
                          leading: const SizedBox(
                            height: 34,
                            width: 34,
                            child: Icon(Icons.manage_accounts,
                              color: Colors.white,),
                          ),
                          title: const Text(
                            "Manage Interests",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),


                  ],
                ),



              ],
            ),
          ),
        ),
    );
  }
}
