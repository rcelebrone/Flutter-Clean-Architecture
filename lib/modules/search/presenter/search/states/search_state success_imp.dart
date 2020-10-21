import 'package:Clean_Dart/modules/search/domain/entities/result_search.dart';
import 'package:Clean_Dart/modules/search/presenter/search/states/search_state.dart';

class SearchStateSuccess implements SearchState {

  final List<ResultSearch> list;

  SearchStateSuccess(this.list);

}