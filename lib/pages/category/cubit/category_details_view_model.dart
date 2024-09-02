import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:newnewsapp/pages/category/cubit/source_states.dart';
import 'package:newnewsapp/repo/sources/source_repo.dart';

@injectable
class CategoryDetailsViewModel extends Cubit<SourceStates> {
  SourceRepo sourceRepo;
  CategoryDetailsViewModel({required this.sourceRepo}): super(SourceLoadingState());
  void getSources(String categoryId) async{
    try {
      emit(SourceLoadingState());
      var response = await sourceRepo.getSources(categoryId);
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
