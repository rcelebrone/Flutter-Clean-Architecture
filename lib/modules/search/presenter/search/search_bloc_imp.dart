import 'package:Clean_Dart/modules/search/domain/usecases/search_by_text.dart';
import 'package:Clean_Dart/modules/search/presenter/search/states/search_state%20error_imp.dart';
import 'package:Clean_Dart/modules/search/presenter/search/states/search_state%20loading_imp.dart';
import 'package:Clean_Dart/modules/search/presenter/search/states/search_state%20start_imp.dart';
import 'package:Clean_Dart/modules/search/presenter/search/states/search_state%20success_imp.dart';
import 'package:Clean_Dart/modules/search/presenter/search/states/search_state.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

class SearchBlocImp extends Bloc<String, SearchState> {
  
  final SearchByText usecase;

  SearchBlocImp(this.usecase) : super(SearchStateStart());

  @override
  Stream<SearchState> mapEventToState(String searchText) async* {
    yield SearchStateLoading();
    final result = await usecase(searchText);
    yield result.fold((l) => SearchStateError(l), (r) => SearchStateSuccess(r));
  }

  @override
  Stream<Transition<String, SearchState>> transformEvents(Stream<String> events, transitionFn) {
    
    return super.transformEvents(events.debounceTime(Duration(milliseconds: 800)), transitionFn);
  }

}