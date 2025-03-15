import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/dependancy_injection/dependancy_injection.dart';
import 'package:absher_app/features/user/ro2ya/screens/frist_step/widget/frist_step_body.dart';
import 'package:absher_app/features/user/ro2ya/provider/steps_provider.dart';
import 'package:absher_app/features/user/ro2ya/screens/second_step/widgets/second_step.dart';
import 'package:absher_app/features/user/ro2ya/screens/third_step/widgets/third_step_body.dart';
import 'package:absher_app/features/user/ro2ya/widgets/controls_steps_builder.dart';
import 'package:absher_app/features/user/ro2ya/widgets/custom_step_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StepsScreen extends StatelessWidget {
  const StepsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget controlsBuilder(context, datails) {
      return ControlsStepsBuilder(
        details: datails,
      );
    }

    final String data = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: CustomStepAppBar(),
      body: ChangeNotifierProvider(
        create: (context) => locator<StepsProvider>(),
        child: Consumer<StepsProvider>(builder: (context, provider, child) {
          return Stepper(
              onStepContinue: provider.onStepContinue,
              onStepCancel: provider.onStepCancel,
              controlsBuilder: controlsBuilder,
              connectorThickness: 1,
              type: StepperType.horizontal,
              currentStep: provider.currentStep,
              onStepTapped: provider.onStepTap,
              steps: [
                Step(
                  state: provider.currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled,
                  label: provider.currentStep == 0
                      ? Text("اختر الباقه")
                      : SizedBox(),
                  title: Text(""),
                  stepStyle: StepStyle(
                    color: provider.currentStep >= 0
                        ? AppColors.brownColor
                        : Colors.grey,
                  ),
                  isActive: provider.currentStep >= 0,
                  content: FristStepBody(
                    provider: provider,
                  ),
                ),
                Step(
                  state: provider.currentStep >= 1
                      ? StepState.complete
                      : StepState.disabled,
                  isActive: provider.currentStep >= 1,
                  label: provider.currentStep == 1
                      ? Text("اضف رؤياك")
                      : SizedBox(),
                  title: Text(""),
                  stepStyle: StepStyle(
                    color: provider.currentStep >= 1
                        ? AppColors.brownColor
                        : Colors.grey,
                  ),
                  content: SecondStepBody(
                    provider: provider,
                  ),
                ),
                Step(
                    state: provider.currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                    title: Text(""),
                    label:
                        provider.currentStep == 2 ? Text("الدفع") : SizedBox(),
                    isActive: provider.currentStep >= 2,
                    stepStyle: StepStyle(
                      color: provider.currentStep >= 2
                          ? AppColors.brownColor
                          : Colors.grey,
                    ),
                    content: ThirdStepBody(
                      provider: provider,
                      aboutRo2ya: data,
                    )),
              ]);
        }),
      ),
    );
  }
}
