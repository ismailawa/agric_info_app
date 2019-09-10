import 'package:agriculture_information/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(AgricultureInfo());

class AgricultureInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

