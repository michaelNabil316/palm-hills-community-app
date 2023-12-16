import 'package:flutter/material.dart';

void navigateTo(context, targetWidget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => targetWidget,
      ),
    );

void navigateAndFinish(context, targetWidget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => targetWidget,
    ),
    (route) => false);

void navigatereplacement(context, targetWidget) => Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => targetWidget,
    ));
