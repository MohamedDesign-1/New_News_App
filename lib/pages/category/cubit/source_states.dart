import '../../../models/SourceResponse.dart';

abstract class SourceStates{}
class SourceLoadingState extends SourceStates{}
class SourceErrorState extends SourceStates{
  String errorMassage;
  SourceErrorState(this.errorMassage);
}
class SourceSuccessState extends SourceStates{
  List<Sources> sourcesList ;
  SourceSuccessState(this.sourcesList);
}