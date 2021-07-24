import 'package:isomanbangkit/data/provider/isoman_provider.dart';
import 'package:isomanbangkit/data/repository/isoman_repository.dart';

class IsomanIntroViewModel {
  late IsomanRepository isomanRepository;
  IsomanIntroViewModel() {
    this.isomanRepository = IsomanRepository(provider: IsomanProvider());
  }

  Future saveIsoman() async {
    this.isomanRepository.addIsoman();
  }
}
