import 'package:agriculture_information/models/json_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {

  test("Test products json parser over the network", () async {
    final url = 'http://localhost:3000/api/products';
    final http.Response response =  await http.get(url);
    if(response.statusCode == 200){
      final jsonString =  response.body;
      expect(parseProducts(jsonString).every((t)=> t.user.isNotEmpty), true);
    }
  });
}
