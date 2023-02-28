import 'package:flutter/material.dart';

import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../constants/image_string.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_string.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int currentStep = 0;
  bool isCompleted = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isCompleted
          ? const Text("Hai")
          : Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(primary: Colors.red)
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
                  TextFormField(
                    // controller: controller.phoneNo,
                    decoration: const InputDecoration(
                      label: Text(kcrozFullName),
                      prefixIcon: Icon(Icons.person_outline_rounded),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
    Step(
      state: currentStep > 1 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 1,
      title: Text(""),
      content: Container(
        padding: const EdgeInsets.fromLTRB(kcrozDefaultSize,kcrozDefaultSize-20,kcrozDefaultSize,0),
        child: Column(
          children: [
            const FormHeaderWidget(
              image: kcrozWelcomeScreenImage,
              title: "What's your email \naddress?",
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
              title: "What's your password?",
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
    Step(
      state: currentStep > 3 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 3,
      title: const Text(""),
      content: Container(
        padding: const EdgeInsets.fromLTRB(kcrozDefaultSize,kcrozDefaultSize,kcrozDefaultSize,0),
        child: Column(
          children: [
            const FormHeaderWidget(
              image: kcrozWelcomeScreenImage,
              title: "My Number is",
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
                  TextFormField(
                    // controller: controller.phoneNo,
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
    Step(
      state: currentStep > 5 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 5,
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
                  TextFormField(
                    // controller: controller.phoneNo,
                    decoration: const InputDecoration(
                      label: Text(kcrozPhoneNo),
                      prefixIcon: Icon(Icons.numbers),
                    ),
                  ),
                  TextFormField(
                    // controller: controller.phoneNo,
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
    Step(
      state: currentStep > 6 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 6,
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
                  TextFormField(
                    // controller: controller.phoneNo,
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
  ];

}
