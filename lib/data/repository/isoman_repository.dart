import 'package:isomanbangkit/data/model/isoman_model.dart';
import 'package:isomanbangkit/data/provider/isoman_provider.dart';

class IsomanRepository {
  IsomanProvider provider;
  IsomanRepository({required this.provider});

  IsomanModel? getIsoman() {
    return provider.getIsoman();
  }

  addIsoman() {
    return provider.addIsoman();
  }

  updateIsoman(String startDate) {
    return provider.updateIsoman(startDate);
  }

  deleteIsoman() {
    return provider.deleteIsoman();
  }
}
