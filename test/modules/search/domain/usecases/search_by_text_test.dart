import 'package:Clean_Dart/modules/search/domain/entities/result_search.dart';
import 'package:Clean_Dart/modules/search/errors/failure_search.dart';
import 'package:Clean_Dart/modules/search/domain/repositories/search_repository.dart';
import 'package:Clean_Dart/modules/search/domain/usecases/search_by_text_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// usando fake com mockito: ^4.1.1 (basta dar extends na classe mock que implementa a abstrata)
class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {

  final repository = SearchRepositoryMock();

  final usecase = SearchByTextImp(repository);

  test('Deve retornar uma lista de ResultSearch', () async {
    when(repository.search(any))
      .thenAnswer((_) async => Right(<ResultSearch>[]));
    // usecase() é o mesmo que usecase.call()... call() fica oculto por padrão
    final result = await usecase('batata');
    // isA<Right> é o lado direito do retorno do either, ou seja, o sucesso (ResultSearch)
    expect(result | null, isA<List<ResultSearch>>());
  });

  test('Deve retornar um InvalidTextError caso o texto seja invalido', () async {
    when(repository.search(any))
      .thenAnswer((_) async => Right(<ResultSearch>[]));
    // usecase() é o mesmo que usecase.call()... call() fica oculto por padrão
    var result = await usecase(null);
    // isLeft (do Either) diz que é o lado esquerdo do retorno (no caso, o Exception)
    expect(result.isLeft(), true);
    // valida o tipo do retorno
    expect(result.fold(id, id), isA<InvalidTextError>());
    // valida qnd vazio
    result = await usecase("");
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}