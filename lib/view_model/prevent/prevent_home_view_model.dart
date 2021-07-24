import 'package:get/get.dart';
import 'package:isomanbangkit/data/model/covid_data_model.dart';
import 'package:isomanbangkit/data/model/user_model.dart';
import 'package:isomanbangkit/data/provider/covid_data_provider.dart';
import 'package:isomanbangkit/data/provider/user_provider.dart';
import 'package:isomanbangkit/data/repository/covid_data_repository.dart';
import 'package:isomanbangkit/data/repository/user_repository.dart';

class PreventHomeViewModel extends GetxController {
  var data = CovidDataModel(total: 0, sembuh: 0, meninggal: 0).obs;
  var userName = "".obs;
  late CovidDataRepository covidDataRepository;
  late UserRepository userRepository;
  PreventHomeViewModel() {
    this.covidDataRepository =
        CovidDataRepository(provider: CovidDataProvider());
    this.userRepository = UserRepository(provider: UserProvider());
  }

  getUserName() async {
    UserModel? user = await this.userRepository.getUser();
    if (user != null) {
      this.userName.value = user.name;
    }
  }

  getCovidDataSummary() async {
    this.data.value = await covidDataRepository.getCovidDataSummary();
  }
}
