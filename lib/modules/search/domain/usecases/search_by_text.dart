import 'package:Clean_Dart/modules/search/domain/entities/result_search.dart';
import 'package:Clean_Dart/modules/search/errors/failure_search.dart';
import 'package:dartz/dartz.dart';

abstract class SearchByText {
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText);
}