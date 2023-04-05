import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';

Widget genderWidget(bool showOtherGender, bool alignVertical, value, defaultSelectedGender){
  return Container(
    alignment: Alignment.center,
    child: GenderPickerWithImage(
      showOtherGender: showOtherGender,
      verticalAlignedText: alignVertical,

      // to show what's selected on app opens, but by default it's Male
      selectedGender: defaultSelectedGender,
      selectedGenderTextStyle: const TextStyle(
          color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
      unSelectedGenderTextStyle: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.normal),
      onChanged: (Gender? gender) {
        if(gender == Gender.Female) {value = "Female";}
        else{value = "Male";}
      },
      //Alignment between icons
      equallyAligned: true,
      animationDuration: const Duration(milliseconds: 300),
      isCircular: true,
      // default : true,
      opacityOfGradient: 0.4,
      padding: const EdgeInsets.all(3),
      size: 140, //default : 40
    ),
  );
}