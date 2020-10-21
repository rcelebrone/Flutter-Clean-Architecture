import 'package:Clean_Dart/modules/search/domain/entities/result_search.dart';
import 'package:Clean_Dart/modules/search/errors/failure_search.dart';
import 'package:Clean_Dart/modules/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'search_by_text.dart';

class SearchByTextImp implements SearchByText {

  final SearchRepository repository;

  SearchByTextImp(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText) async {

    if(searchText == null || searchText.isEmpty)
      return Left(InvalidTextError());

    return repository.search(searchText);
  }
  
}