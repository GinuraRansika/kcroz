import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../common_widgets/text_field_input.dart';
import '../../../../../constants/image_string.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_string.dart';
import '../../../../../services/firebase_auth_methods.dart';
import '../../../../../utils/utils.dart';
import '../../controllers/signup_controller.dart';
import '../../models/user_model.dart';

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

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = _image;
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void signUpUser() async {
    final user = UserModel(
        fullName: controller.fullName.text.trim(),
        email: controller.email.text.trim(),
        password: controller.password.text.trim(),
        phoneNo: controller.phoneNo.text.trim());

    // await UserRepository.instance.createUser(user);

    await FirebaseAuthMethods().signUpWithEmail(
        email: controller.email.text,
        fullName: controller.fullName.text,
        phoneNo: controller.phoneNo.text,
        password: controller.password.text,
        religion: controller.religion.text,
        context: context);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isCompleted
          ? const Text("Hai")
          : Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(primary: Colors.red)
              ),
              child: Stepper(
                type: StepperType.horizontal,
                steps: getSteps(),
                currentStep: currentStep,
                onStepContinue: () {
                  final isLastStep = currentStep == getSteps().length -1;
                  if(isLastStep) {
                    setState(() {
                      isCompleted = true;
                    });
                    signUpUser();
                    print("LastStep");
                  } else{
                    setState(() {currentStep += 1;});
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
                    margin: EdgeInsets.only(top: 50),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: controls.onStepContinue,
                            child: Text(isLastStep ? "Confirm" : "Next"),
                          )
                        ),
                        const SizedBox(width: 12,),
                        if(currentStep != 0)
                          Expanded(
                            child: ElevatedButton(
                              onPressed: controls.onStepCancel,
                              child: Text("Back"),
                            )
                          )
                      ],
                    ),
                  );
                },
              ),
            ),
      ),
    );
  }

  List<Step> getSteps() => [
    // Name
    Step(
      state: currentStep > 0 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 0,
      title: Text(""),
      content: Container(
        padding: const EdgeInsets.fromLTRB(kcrozDefaultSize,kcrozDefaultSize,kcrozDefaultSize,0),
        child: Column(
          children: [
            const FormHeaderWidget(
              image: kcrozWelcomeScreenImage,
              title: "What's your name?",
              subTitle: "We protect our community by making sure everyone on Kcroz is real.",
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
        padding: const EdgeInsets.fromLTRB(kcrozDefaultSize,kcrozDefaultSize,kcrozDefaultSize,0),
        child: Column(
          children: [
            const FormHeaderWidget(
              image: kcrozWelcomeScreenImage,
              title: "Religion?",
              subTitle: "We protect our community by making sure everyone on Kcroz is real.",
              imageHeight: 0.3,
            ),
            Container(
              padding: const EdgeInsets.only(top: kcrozDefaultSize + 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldInput(
                    textEditingController: controller.religion,
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

    // Profile Pic
    Step(
      state: currentStep > 2 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 2,
      title: Text(""),
      content: Container(
        padding: const EdgeInsets.fromLTRB(kcrozDefaultSize,kcrozDefaultSize-20,kcrozDefaultSize,0),
        child: Column(
          children: [
            const FormHeaderWidget(
              image: kcrozWelcomeScreenImage,
              title: "Add Your Profile Photo",
              subTitle: "We protect our community by making sure everyone on Kcroz is real.",
              imageHeight: 0.3,
            ),
            Container(
              padding: const EdgeInsets.only(top: kcrozDefaultSize + 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    // controller: controller.phoneNo,
                    decoration: const InputDecoration(
                      label: Text(kcrozEmail),
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
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
        padding: const EdgeInsets.fromLTRB(kcrozDefaultSize,kcrozDefaultSize,kcrozDefaultSize,0),
        child: Column(
          children: [
            const FormHeaderWidget(
              image: kcrozWelcomeScreenImage,
              title: "I am",
              subTitle: "",
              imageHeight: 0.3,
            ),
            Container(
              padding: const EdgeInsets.only(top: kcrozDefaultSize + 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldInput(
                    textEditingController: controller.gender,
                    labelText: kcrozPassword,
                    prefixIcon: const Icon(Icons.fingerprint),
                    hintText: kcrozPassword,
                    textInputType: TextInputType.text,
                  ),
                  TextFieldInput(
                    textEditingController: controller.sexualOrientation,
                    labelText: kcrozPassword,
                    prefixIcon: const Icon(Icons.fingerprint),
                    hintText: kcrozPassword,
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
        padding: const EdgeInsets.fromLTRB(kcrozDefaultSize,kcrozDefaultSize,kcrozDefaultSize,0),
        child: Column(
          children: [
            const FormHeaderWidget(
              image: kcrozWelcomeScreenImage,
              title: "When's your birthday?",
              subTitle: "",
              imageHeight: 0.3,
            ),
            Container(
              padding: const EdgeInsets.only(top: kcrozDefaultSize + 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldInput(
                    textEditingController: controller.birthday,
                    labelText: kcrozPassword,
                    prefixIcon: const Icon(Icons.fingerprint),
                    hintText: kcrozPassword,
                    textInputType: TextInputType.datetime,
                  ),
                ],
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
        padding: const EdgeInsets.fromLTRB(kcrozDefaultSize,0,kcrozDefaultSize,0),
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
                      label: Text(kcrozPhoneNo),
                      prefixIcon: Icon(Icons.numbers),
                    ),
                  ),
                  TextFormField(

                    decoration: const InputDecoration(
                      label: Text(kcrozPhoneNo),
                      prefixIcon: Icon(Icons.numbers),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text(kcrozPhoneNo),
                      prefixIcon: Icon(Icons.numbers),
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
        padding: const EdgeInsets.fromLTRB(kcrozDefaultSize,0,kcrozDefaultSize,0),
        child: Column(
          children: [
            const FormHeaderWidget(
              image: kcrozWelcomeScreenImage,
              title: "Drink,Smoke, Diet?",
              subTitle: "",
              imageHeight: 0.3,
            ),
            Container(
              padding: const EdgeInsets.only(top: kcrozDefaultSize ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text(kcrozPhoneNo),
                      prefixIcon: Icon(Icons.numbers),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text(kcrozPhoneNo),
                      prefixIcon: Icon(Icons.numbers),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text(kcrozPhoneNo),
                      prefixIcon: Icon(Icons.numbers),
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
        padding: const EdgeInsets.fromLTRB(kcrozDefaultSize,kcrozDefaultSize,kcrozDefaultSize,0),
        child: Column(
          children: [
            const FormHeaderWidget(
              image: kcrozWelcomeScreenImage,
              title: "My Interests are",
              subTitle: "We protect our community by making sure everyone on Kcroz is real.",
              imageHeight: 0.3,
            ),
            Container(
              padding: const EdgeInsets.only(top: kcrozDefaultSize + 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldInput(
                    textEditingController: controller.interests,
                    labelText: kcrozPassword,
                    prefixIcon: const Icon(Icons.fingerprint),
                    hintText: kcrozPassword,
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
