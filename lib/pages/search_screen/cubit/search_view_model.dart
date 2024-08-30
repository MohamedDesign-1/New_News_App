
import 'package:bloc/bloc.dart';
import 'package:newnewsapp/pages/search_screen/cubit/search_states.dart';

import '../../../api/api_manger.dart';

class SearchViewModel extends Cubit<SearchStates> {
  SearchViewModel() : super(SearchLoadingState());

  void getResults(String query) async{
  try {
    emit(SearchLoadingState());
    var response = await ApiManger.getSearchNews(query);
    if (response?.status == 'error') {
    emit(SearchErrorState(response!.message!));
    }
    if (response?.status == 'ok') {
    emit(SearchSuccessState(response!.articles!));
    }
    } catch (e) {
      emit(SearchErrorState(e.toString()));
    }
  }

  void getSuggestions(String query) async{
    try {
      emit(SearchLoadingState());
      var response = await ApiManger.getSearchNews(query);
      if (response?.status == 'error') {
        emit(SearchErrorState(response!.message!));
      }
      if (response?.status == 'ok') {
        emit(SearchSuccessState(response!.articles!));
      }
    } catch (e) {
      emit(SearchErrorState(e.toString()));
    }
  }
}