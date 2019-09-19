import 'package:http/http.dart' as http;
import 'dart:collection';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

import 'json_parser.dart';
import 'product.dart';

class ProductBloc {
  final _productsSubjects = BehaviorSubject<UnmodifiableListView<Product>>();
  var _products = <Product>[];

  ProductBloc(){
    getData().then((_){
      _productsSubjects.add(UnmodifiableListView(_products));
    });
  }
  Stream<UnmodifiableListView<Product>> get products => _productsSubjects.stream;

  Future<List<Product>> getData() async {
    http.Response response = await http.get(
        Uri.encodeFull("http://10.0.2.2:3000/api/products"),
        headers: {'Accept': 'application/json'});
    _products = parseProducts(response.body);
    return parseProducts(response.body);
  }

  void dispose(){
    _productsSubjects.close();
  }
}