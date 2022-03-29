import 'package:graphql/client.dart';

class GraphQlConfig {
  final httpLink = HttpLink('https://development.aifa.workers.dev/v1/gql');

  GraphQLClient client() {
    final client = GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );
    return client;
  }
}
