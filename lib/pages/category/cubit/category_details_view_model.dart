import 'package:bloc/bloc.dart';
import 'package:newnewsapp/pages/category/cubit/source_states.dart';

import '../../../api/api_manger.dart';

class CategoryDetailsViewModel extends Cubit<SourceStates> {
  CategoryDetailsViewModel(): super(SourceLoadingState());
  void getSources(String categoryId) async{
    try {
      emit(SourceLoadingState());
      var response = await ApiManger.getSources(categoryId);
      if (response?.status == 'error') {
        emit(SourceErrorState(response!.message!));
        return ;
      }
      if (response?.status == 'ok') {
        emit(SourceSuccessState(response!.sources!));
      }
    } catch (e) {
      emit(SourceErrorState(e.toString()));
    }
  }
}
