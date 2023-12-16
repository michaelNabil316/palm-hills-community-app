import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../shared_components/custom_app_bars/app_bar_multiline.dart';
import 'controller/create_controller.dart';

class CreateAccountScreen extends StatefulWidget {
  final String accountName;
  const CreateAccountScreen({super.key, required this.accountName});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAccountCtrl>(
      init: CreateAccountCtrl(),
      builder: (controller) {
        return Scaffold(
          appBar: appBarMultinLine(
            title: "CREATE ACCOUNT",
            subtitle:
                "AS ${widget.accountName == "Owner" ? "AN OWNER" : "A ${widget.accountName}"}"
                    .toUpperCase(),
            onPressBackBtn: () {
              Navigator.pop(context);
              controller.resetCurrentIndex();
            },
          ),
          body: controller.creationSteps[controller.currentIndex],
        );
      },
    );
  }
}
