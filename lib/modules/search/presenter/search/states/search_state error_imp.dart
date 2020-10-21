import 'package:Clean_Dart/modules/search/errors/failure_search.dart';
import 'package:Clean_Dart/modules/search/presenter/search/states/search_state.dart';

class SearchStateError implements SearchState {

  final FailureSearch failure;

  SearchStateError(this.failure);

  
}