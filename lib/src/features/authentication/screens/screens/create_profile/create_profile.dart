import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kcroz/src/constants/creat_profile_text_string.dart';
import 'package:kcroz/src/features/authentication/screens/screens/create_profile/additional_step.dart';
import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../common_widgets/text_field_input.dart';
import '../../../../../constants/image_string.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_string.dart';
import '../../../../../services/firebase_auth_methods.dart';
import '../../../../../utils/utils.dart';
import '../../controllers/signup_controller.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key,}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  SignUpController controller = Get.put(SignUpController());
  Uint8List? _image;
  int currentStep = 0;
  bool isCompleted = false;
  DateTime _dateTime = DateTime.now();

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void signUpUser() async {
    String result = await FirebaseAuthMethods().signUpWithEmail(
        email: controller.email.text.trim(),
        fullName: controller.fullName.text.trim(),
        phoneNumber: controller.phoneNo.text.trim(),
        password: controller.password.text.trim(),
        religion: controller.religion.text.trim(),
        gender: controller.gender.text.trim(),
        sexualOrientation: controller.sexualOrientation.text.trim(),
        birthday:
            "${_dateTime.year}-"
            "${_dateTime.month.toString().length == 2? _dateTime.month : {'0${_dateTime.month}'}}-"
            "${_dateTime.day.toString().length == 2? _dateTime.day : {'0${_dateTime.day}'}}",
        interests: controller.interests.text.trim(),
        file: _image!,
        context: context);

    if(result.substring(0,5) != "Error"){
      Get.to(() => const AdditionalStep());
    } else {
      Get.snackbar("Error", result.substring(8),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        body:
        Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.purple[900],
            colorScheme:  ColorScheme.light(primary: Colors.purple,)
          ),
          child: Container(
            decoration: BoxDecoration(
                image: isDarkMode ? const DecorationImage(
                    image: AssetImage(kcrozDarkBackgroundImage1),
                    fit: BoxFit.cover
                ):const DecorationImage(
                    image: AssetImage(kcrozLightBackgroundImage1),
                    fit: BoxFit.cover
                )
            ),
            child: Stepper(
              type: StepperType.horizontal,
              steps: getSteps(),
              currentStep: currentStep,
              onStepContinue: () {
                final isLastStep = currentStep == getSteps().length -1;
                if(validate(currentStep))
                {
                  if(isLastStep) {
                    setState(() {
                      isCompleted = true;
                    });
                    signUpUser();
                  } else {
                    setState(() {currentStep += 1;});
                  }
                }else{
                  Get.snackbar("Error","Please add your Details",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.redAccent.withOpacity(0.1),
                      colorText: Colors.red);
                }
              },
              onStepTapped: (step){
                setState(() {
                  currentStep = step;
                });
              },
              onStepCancel: () {
                if(currentStep == 0){
                  print("GO Back");
                }
                else{
                  setState(() {currentStep -= 1;});
                }
              },
              controlsBuilder: (context, ControlsDetails controls) {
                final isLastStep = currentStep == getSteps().length -1;
                return Container(
                  margin:EdgeInsets.only(top: 50),
                  child: Row(
                    children: [
                      if(currentStep != 0)
                        Expanded(
                            child: ElevatedButton(
                              onPressed: controls.onStepCancel,
                              child: Text("Back"),
                            )
                        ),
                      const SizedBox(width: 12,),
                      Expanded(
                          child: ElevatedButton(
                            onPressed: controls.onStepContinue,
                            child: Text(isLastStep ? "Confirm" : "Next"),
                          )
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  bool validate(int currentStep) {
    if(currentStep == 0) {
      if(controller.fullName.text.isNotEmpty){
        return true;
      }
    }
    else if(currentStep == 1){
      if(controller.religion.text.isNotEmpty) {
        return true;
      }
    }
    else if(currentStep == 2){
      if(_image != null) {
        return true;
      }
    }
    else if(currentStep == 3){
      if(controller.gender.text.isNotEmpty && controller.sexualOrientation.text.isNotEmpty) {
        return true;
      }
    }
    else if(currentStep == 4){
      return true;
    }
    else if(currentStep == 5){
        return true;
    }
    else if(currentStep == 6){
        return true;

    }
    else if(currentStep == 7){
      if(controller.interests.text.isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  bool checkDark(){
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return isDarkMode;
  }

  List<Step> getSteps() => [
    // Name
    Step(
      state: currentStep > 0 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 0,
      title: const Text(""),
      content: Container(
        padding: const EdgeInsets.fromLTRB(kcrozDefaultSize,kcrozDefaultSize,kcrozDefaultSize,0),
        child: Column(
          children: [
            FormHeaderWidget(
              image: checkDark() ? kcrozNameDarkDoodle : kcrozNameLightDoodle,
              title: "What's your name?",
              subTitle: "This is how it will appear in Kcroz Profile",
              imageHeight: 0.3,
            ),
            Container(
              padding: const EdgeInsets.only(top: kcrozDefaultSize + 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldInput(
                    textEditingController: controller.fullName,
                    labelText: kcrozFullName,
                    prefixIcon: const Icon(Icons.person_outline_rounded),
                    hintText: kcrozFullName,
                    textInputType: TextInputType.text,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),

    // Religion
    Step(
      state: currentStep > 1 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 1,
      title: Text(""),
      content: Container(
        padding: const EdgeInsets.fromLTRB(
            kcrozDefaultSize, kcrozDefaultSize, kcrozDefaultSize, 0),
        child: Column(
          children: [
            const FormHeaderWidget(
              image: kcrozWelcomeScreenImage,
              title: "Religion?",
              subTitle:
              "We protect our community by making sure everyone on Kcroz is real.",
              imageHeight: 0.3,
            ),
            Container(
              padding: const EdgeInsets.only(top: kcrozDefaultSize + 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldInput(
                    textEditingController: controller.religion,
                    labelText: religionTextFieldText,
                    prefixIcon: const Icon(Icons.type_specimen),
                    hintText: religionTextFieldText,
                    textInputType: TextInputType.text,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),


    // Profile Pic
    Step(
      state: currentStep > 2 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 2,
      title: Text(""),
      content: Container(
        padding: const EdgeInsets.fromLTRB(
            kcrozDefaultSize, kcrozDefaultSize - 20, kcrozDefaultSize, 0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: kcrozDefaultSize + 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    profilePicPageTitle,
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 80,),
                  // circular widget to add dp
                  Stack(
                    children: [
                      _image != null
                          ? CircleAvatar(
                        radius: 150,
                        backgroundImage: MemoryImage(_image!),
                      )
                          : const CircleAvatar(
                        radius: 150,
                        backgroundImage:
                        AssetImage(kcrozDefaultProfileImage),
                      ),
                      Positioned(
                          bottom: 10,
                          left: 200,
                          child: IconButton(
                            onPressed: () {
                              selectImage();
                            },
                            icon: const Icon(
                              Icons.add_circle_outlined,
                              size: 50,
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(height: 80,),
                ],
              ),
            )
          ],
        ),
      ),
    ),

    // Gender, Sexual Orientation
    Step(
      state: currentStep > 3 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 3,
      title: Text(""),
      content: Container(
        padding: const EdgeInsets.fromLTRB(
            kcrozDefaultSize, kcrozDefaultSize, kcrozDefaultSize, 0),
        child: Column(
          children: [
            const FormHeaderWidget(
              image: kcrozWelcomeScreenImage,
              title: "I am",
              subTitle: "",
              imageHeight: 0.3,
            ),
            Container(
              padding: const EdgeInsets.only(top: kcrozDefaultSize - 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldInput(
                    textEditingController: controller.gender,
                    labelText: "Gender",
                    prefixIcon: const Icon(Icons.hourglass_empty_rounded),
                    hintText: "Gender",
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "Interested In",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(height: 20,),
                  TextFieldInput(
                    textEditingController: controller.sexualOrientation,
                    labelText: "Sexual Orientation",
                    prefixIcon: const Icon(Icons.heat_pump_rounded),
                    hintText: "Sexual Orientation",
                    textInputType: TextInputType.text,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),


    // Birthday
    Step(
      state: currentStep > 4 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 4,
      title: Text(""),
      content: Container(
        padding: const EdgeInsets.fromLTRB(
            kcrozDefaultSize, kcrozDefaultSize, kcrozDefaultSize, 0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: kcrozDefaultSize + 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "When's your Birthday?",
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 300,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: _dateTime,
                        onDateTimeChanged: (dateTime) {
                          setState(() {
                            _dateTime = dateTime;
                          });
                        }
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),

    // Occupation, University, College
    Step(
      state: currentStep > 5 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 5,
      title: Text(""),
      content: Container(
        padding: const EdgeInsets.fromLTRB(
            kcrozDefaultSize, 0, kcrozDefaultSize, 0),
        child: Column(
          children: [
            const FormHeaderWidget(
              image: kcrozWelcomeScreenImage,
              title: "Occupation,University,College?",
              subTitle: "",
              imageHeight: 0.3,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Occupation"),
                      prefixIcon: Icon(Icons.cast_for_education),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("University"),
                      prefixIcon: Icon(Icons.book),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("College"),
                      prefixIcon: Icon(Icons.book_online_rounded),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),

    // Drink, Smoke, Diet
    Step(
      state: currentStep > 6 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 6,
      title: Text(""),
      content: Container(
        padding: const EdgeInsets.fromLTRB(
            kcrozDefaultSize, 0, kcrozDefaultSize, 0),
        child: Column(
          children: [
            const FormHeaderWidget(
              image: kcrozWelcomeScreenImage,
              title: "Drink,Smoke, Diet?",
              subTitle: "",
              imageHeight: 0.3,
            ),
            Container(
              padding: const EdgeInsets.only(top: kcrozDefaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Drink"),
                      prefixIcon: Icon(Icons.local_drink),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Smoke"),
                      prefixIcon: Icon(Icons.smoke_free_rounded),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Diet"),
                      prefixIcon: Icon(Icons.food_bank_rounded),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),

    // Interests
    Step(
      state: currentStep > 7 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 7,
      title: Text(""),
      content: Container(
        padding: const EdgeInsets.fromLTRB(
            kcrozDefaultSize, kcrozDefaultSize, kcrozDefaultSize, 0),
        child: Column(
          children: [
            const FormHeaderWidget(
              image: kcrozWelcomeScreenImage,
              title: "My Interests are",
              subTitle:
              "We protect our community by making sure everyone on Kcroz is real.",
              imageHeight: 0.3,
            ),
            Container(
              padding: const EdgeInsets.only(top: kcrozDefaultSize + 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldInput(
                    textEditingController: controller.interests,
                    labelText: "Interests",
                    prefixIcon: const Icon(Icons.sports_cricket),
                    hintText: "Interests",
                    textInputType: TextInputType.text,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),

  ];
}
