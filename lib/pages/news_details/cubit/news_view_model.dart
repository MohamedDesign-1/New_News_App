import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:newnewsapp/repo/news/getnews_repo.dart';
import 'news_states.dart';

@injectable
class NewsViewModel extends Cubit<NewsStates> {
  GetNewsRepo getNewsRepo;
  NewsViewModel({required this.getNewsRepo}): super(NewsLoadingState());

  void getNewsBySourceId(String sourceId) async{
    try{
      emit(NewsLoadingState());
      var response = await getNewsRepo.getNews(sourceId);
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