import 'dart:collection';
import 'package:agriculture_information/models/product.dart';
import 'package:agriculture_information/models/productBloc.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final ProductBloc bloc;
  ProductPage({ Key key, this.bloc });
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
        child:  StreamBuilder<UnmodifiableListView<Product>>(
          stream: widget.bloc.products,
          initialData: UnmodifiableListView<Product>([]),
          builder: (context, snapshot ){
            return ListView(
              children: snapshot.data.map(_buildProduct).toList(),
            );
          },
        )
    );
  }
  Widget _buildProduct(Product product){
    return Text(product.name);
  }
}
