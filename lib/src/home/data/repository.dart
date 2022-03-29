import 'package:graphql_prueba/src/model/data_model.dart';

abstract class Repository {
  Future<List<Question>> consulta(String lang);
}
