import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:graphql_prueba/src/Config/graphql_config.dart';
import 'package:graphql_prueba/src/home/data/repository.dart';
import 'package:graphql_prueba/src/home/graphql/query.dart';
import 'package:graphql_prueba/src/model/data_model.dart';

class RepositoryImpl implements Repository {
  @override
  Future<List<Question>> consulta(String lang) async {
    // try {
    final List query = Query().getQuery(lang: lang);
    final GraphQLClient _client = GraphQlConfig().client();
    final QueryResult queryResult = await _client
        .query(
          QueryOptions(
              fetchPolicy: FetchPolicy.networkOnly,
              document: gql(query[0]),
              variables: query[1]),
        )
        .timeout(
          const Duration(seconds: 30),
        );

    final json = queryResult.data?['faq']['questions'] as List<dynamic>;
    print(json);
    final response = json.map((e) => Question.fromJson(e)).toList();
    return response;
    // } catch (e) {
    //   debugPrint(
    //     e.toString(),
    //   );
    // }
  }
}
