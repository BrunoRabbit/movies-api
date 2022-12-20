// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

// class GraphqlService {
//   // get graphqlClient for main.dart
//   static ValueNotifier<GraphQLClient> get graphClient {
//     final ValueNotifier<GraphQLClient> client = ValueNotifier(getClient);

//     return client;
//   }

//   /// initialize a graphqlClient for consult the GraphQL
//   static GraphQLClient get getClient {
//     final String url = dotenv.get('URL');
//     final String apiKey = dotenv.get('API_KEY');

//     final HttpLink _httpLink = HttpLink(url);
//     final AuthLink authLink = AuthLink(
//       getToken: () async => apiKey,
//     );

//     final Link _link = authLink.concat(_httpLink);

//     final GraphQLClient graphQLClient = GraphQLClient(
//       link: _link,
//       cache: GraphQLCache(),
//     );

//     return graphQLClient;
//   }

//   // The next two method is to consult the GraphQL using query and mutation
//   Future<QueryResult<Object?>> query(
//       {required String document,
//       Map<String, dynamic> variables = const {}}) async {
//     QueryOptions options = QueryOptions(
//       document: gql(document),
//       variables: variables,
//     );

//     return await getClient.query(options);
//   }

//   Future<QueryResult<Object?>> mutation(
//       {required String document,
//       Map<String, dynamic> variables = const {}}) async {
//     MutationOptions options = MutationOptions(
//       document: gql(document),
//       variables: variables,
//     );

//     return await getClient.mutate(options);
//   }
// }
