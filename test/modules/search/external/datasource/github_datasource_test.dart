import 'dart:convert';

import 'package:Clean_Dart/modules/search/errors/failure_search.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:Clean_Dart/modules/search/external/datasources/github_datasource_imp.dart';

import '../../utils/github_result_json.dart';

class DioMock extends Mock implements Dio {}

main() {

  final dio = DioMock();
  final datasource = GitHubDatasourceImp(dio);

  test('deve retornar uma lista de ResultSearchModel', () async {
    when(dio.get(any))
      .thenAnswer((_) async => Response(data: jsonDecode(githubResult), statusCode: 200));
    
    final future = datasource.getSearch("searchText");
    expect(future, completes);

  });

  test('deve retornar um erro se o statusCode não é 200', () async {
    when(dio.get(any))
      .thenAnswer((_) async => Response(data: null, statusCode: 401));
    
    final future = datasource.getSearch("searchText");
    expect(future, throwsA(isA<DatasourceError>()));

  });

}