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
import 'profile_feed.dart';

import '../../../../constants/text_string.dart';


class LanguageSettings extends StatefulWidget {
  const LanguageSettings({Key? key}) : super(key: key);

  @override
  State<LanguageSettings> createState() => _LanguageSettingsState();
}

class _LanguageSettingsState extends State<LanguageSettings> {


  final List<String> _appLanguages = ['English', 'French', 'Spanish', 'German'];
  String _selectedAppLanguage = 'English';

  List<String> _preferredLanguages = ['English', 'French', 'Spanish', 'German'];
  final String _selectedPreferredLanguage = 'French';

  final List<String> _translationLanguages = ['English', 'French', 'Spanish', 'German'];
  String _selectedTranslationLanguage = 'English';



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
        title: Text('Language', style: Theme.of(context).textTheme.headline4,),
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
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 16.0),
                    width: 292,
                    height: 50,
                    child: const Text('App Language', style: TextStyle(
                      fontSize: 20,

                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ),

                  Container(
                    width: 100,
                    height: 50,
                    child:
                    DropdownButton(
                      value: _selectedAppLanguage,
                      items: _appLanguages.map((language) {
                        return DropdownMenuItem(
                          value: language,
                          child: Text(language,
                            textAlign: TextAlign.left,),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedAppLanguage = newValue!;
                        });
                      },
                    ),
                  ),

                ],
              ),


              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 16.0),
                    width: 292,
                    height: 50,
                    child: const Text('Preferred Language', style: TextStyle(
                      fontSize: 20,

                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ),

                  Container(
                    width: 100,
                    height: 50,
                    child:
                    DropdownButton(
                      value: _selectedPreferredLanguage,
                      items: _preferredLanguages.map((language) {
                        return DropdownMenuItem(
                          value: language,
                          child: Text(language,
                            textAlign: TextAlign.left,),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _preferredLanguages = newValue! as List<String>;
                        });
                      },
                    ),
                  ),

                ],
              ),


              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 16.0),
                    width: 292,
                    height: 50,
                    child: const Text('Translation Language', style: TextStyle(
                      fontSize: 20,

                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ),

                  Container(
                    width: 100,
                    height: 50,
                    child:
                    DropdownButton(
                      value: _selectedTranslationLanguage,
                      items: _translationLanguages.map((language) {
                        return DropdownMenuItem(
                          value: language,
                          child: Text(language,
                            textAlign: TextAlign.left,),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedTranslationLanguage = newValue!;
                        });
                      },
                    ),
                  ),

                ],
              ),





            ]),
      ),
    );
  }
}


