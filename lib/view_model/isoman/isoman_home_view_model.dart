import 'package:get/get.dart';
import 'package:isomanbangkit/data/model/isoman_model.dart';
import 'package:isomanbangkit/data/provider/isoman_provider.dart';
import 'package:isomanbangkit/data/repository/isoman_repository.dart';

class IsomanHomeViewModel extends GetxController {
  late IsomanRepository isomanRepository;
  var dayOn = 0.obs;
  var listDayAsBoolean = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ].obs;

  IsomanHomeViewModel() {
    isomanRepository = IsomanRepository(provider: IsomanProvider());
  }
  getDaysLeft() async {
    IsomanModel? isoman = await isomanRepository.getIsoman();
    if (isoman != null) {
      var day = isoman.endDate.difference(isoman.startDate).inDays;
      dayOn.value = day;
      listDayAsBoolean.value = [];
      for (var i = 0; i < 14; i++) {
        if ((i + 1) <= day) {
          listDayAsBoolean.add(false);
        } else {
          listDayAsBoolean.add(true);
        }
      }
      print(listDayAsBoolean);
    }
    return null;
  }
}
