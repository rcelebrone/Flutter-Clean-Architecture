import 'package:dartz/dartz.dart';
import 'package:Clean_Dart/modules/search/domain/entities/result_search.dart';
import 'package:Clean_Dart/modules/search/errors/failure_search.dart';
import 'package:Clean_Dart/modules/search/domain/repositories/search_repository.dart';
import 'package:Clean_Dart/modules/search/infra/datasources/search_datasource.dart';

class SearchRepositoryImp implements SearchRepository{

  final SearchDatasource datasource;

  SearchRepositoryImp(this.datasource);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText) async {
    try{
      final result = await datasource.getSearch(searchText);

      return Right(result);
    } on DatasourceError catch(e) {
      return Left(e);
    } catch(e) {
      return Left(DatasourceError('Unknown error'));
    }
  }

}