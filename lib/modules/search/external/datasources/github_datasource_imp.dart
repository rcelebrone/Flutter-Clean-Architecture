import 'package:Clean_Dart/modules/search/errors/failure_search.dart';
import 'package:Clean_Dart/modules/search/infra/datasources/search_datasource.dart';
import 'package:Clean_Dart/modules/search/infra/models/result_search_model.dart';
import 'package:dio/dio.dart';

class GitHubDatasourceImp implements SearchDatasource {

  final Dio dio;

  GitHubDatasourceImp(this.dio);

  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    
    final response = await dio.get("https://api.github.com/search/users?q=${searchText.spaceToPlus()}");
    
    if(response.statusCode == 200) {
      final list = (response.data['items'] as List)
        .map((e) => ResultSearchModel.fromMap(e)).toList();

      return list;
    } else 
      throw DatasourceError("Status code is not 200");
  }

}

extension on String {
  spaceToPlus() {
    return this.replaceAll(" ", "+");
  }
}