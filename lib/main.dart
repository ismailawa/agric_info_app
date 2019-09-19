import 'package:agriculture_information/models/productBloc.dart';
import 'package:flutter/material.dart';
import 'package:agriculture_information/pages/home_page.dart';

void main() {
  final productsBloc = ProductBloc();
  runApp(AgricultureInfo(bloc: productsBloc,));
}

class AgricultureInfo extends StatelessWidget {
  final ProductBloc bloc;
  AgricultureInfo({
    Key key,
    this.bloc
});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(bloc: bloc),
    );
  }
}

