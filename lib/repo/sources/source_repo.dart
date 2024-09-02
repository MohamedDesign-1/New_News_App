import '../../models/SourceResponse.dart';

abstract class SourceRepo {
  Future<SourceResponse?> getSources(String categoryId);
}

