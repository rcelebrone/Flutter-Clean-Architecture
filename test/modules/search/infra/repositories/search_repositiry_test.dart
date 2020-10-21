import 'package:Clean_Dart/modules/search/domain/entities/result_search.dart';
import 'package:Clean_Dart/modules/search/errors/failure_search.dart';
import 'package:Clean_Dart/modules/search/infra/models/result_search_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:Clean_Dart/modules/search/infra/datasources/search_datasource.dart';
import 'package:Clean_Dart/modules/search/infra/repositories/search_repository_imp.dart';

class SearchDatasourceMock extends Mock implements SearchDatasource {}

main() {

  final datasource = SearchDatasourceMock();
  final repository = SearchRepositoryImp(datasource);

  test('deve retornar uma lista de ResultSearchModel', () async {
    when(datasource.getSearch(any))
      .thenAnswer((_) async => <ResultSearchModel>[]);
    final result = await repository.search('jamilão');
    expect(result | null, isA<List<ResultSearch>>());
  });

  test('deve retornar um DatasourceError se o datasource falhar', () async {
    when(datasource.getSearch(any))
      .thenThrow(Exception());
    final result = await repository.search('jamilão');
    expect(result.fold(id, id), isA<DatasourceError>());
  });

}