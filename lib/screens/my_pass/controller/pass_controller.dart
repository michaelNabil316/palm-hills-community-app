import 'package:get/get.dart';

class PassController extends GetxController
{
  String _action="Beach";

  String get action => _action;

  void SetAction(String value) {
    _action = value;
    update();
  }
}