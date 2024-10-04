import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final pokeApiClient = Provider<GraphQLClient>((ref) {
  return GraphQLClient(
    cache: GraphQLCache(),
    link: HttpLink('https://beta.pokeapi.co/graphql/v1beta'),
  );
});
