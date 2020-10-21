import 'package:Clean_Dart/modules/search/errors/failure_search.dart';
import 'package:Clean_Dart/modules/search/presenter/search/states/search_state%20error_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:Clean_Dart/modules/search/domain/entities/result_search.dart';
import 'package:Clean_Dart/modules/search/domain/usecases/search_by_text.dart';
import 'package:Clean_Dart/modules/search/presenter/search/search_bloc_imp.dart';
import 'package:Clean_Dart/modules/search/presenter/search/states/search_state%20loading_imp.dart';
import 'package:Clean_Dart/modules/search/presenter/search/states/search_state%20success_imp.dart';

class SearchByTextMock extends Mock implements SearchByText {}

main() {

  final usecase = SearchByTextMock();

  final bloc = SearchBlocImp(usecase);

  test('deve retornar os estados na ordem correta', () {
    
    when(usecase.call(any))
      .thenAnswer((_) async => Right(<ResultSearch>[]));

    expect(bloc, emitsInOrder([
        isA<SearchStateLoading>(),
        isA<SearchStateSuccess>()
    ]));
    
    bloc.add("Ruka");
  });


  test('deve retornar erro quanto o texto for inválido', () {
    
    when(usecase.call(any))
      .thenAnswer((_) async => Left(InvalidTextError()));

    expect(bloc, emitsInOrder([
        isA<SearchStateLoading>(),
        isA<SearchStateError>()
    ]));
    
    bloc.add("Ruka");
  });
}