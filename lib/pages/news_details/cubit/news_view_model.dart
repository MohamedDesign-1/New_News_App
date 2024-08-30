import 'package:bloc/bloc.dart';

import '../../../api/api_manger.dart';
import 'news_states.dart';

class NewsViewModel extends Cubit<NewsStates> {
  NewsViewModel() : super(NewsLoadingState());

  void getNewsBySourceId(String sourceId) async{
    try{
      emit(NewsLoadingState());
      var response = await ApiManger.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        emit(NewsErrorState(response!.message!));
      }
      if (response?.status == 'ok') {
        emit(NewsSuccessState(response!.articles!));
      }
    }catch(e){
      emit(NewsErrorState(e.toString()));
    }

  }
}