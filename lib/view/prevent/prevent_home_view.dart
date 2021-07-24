import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isomanbangkit/components/IBAppBar.dart';
import 'package:isomanbangkit/routes/routes_name.dart';
import 'package:isomanbangkit/view_model/prevent/prevent_home_view_model.dart';

class PreventHomeView extends StatelessWidget {
  PreventHomeViewModel viewModel = Get.put(PreventHomeViewModel());

  @override
  Widget build(BuildContext context) {
    viewModel.getCovidDataSummary();
    return Scaffold(
      appBar: getIBAppBar(),
      body: SafeArea(
          bottom: false,
          child: Stack(alignment: Alignment.center, children: [
            ListView(
              children: [
                GreetingSection(),
                RealDivider(),
                CovidDataSection(),
                RealDivider(),
                PanduanSection()
              ],
            ),
            WarnButton()
          ])),
    );
  }
}

class PanduanSection extends StatelessWidget {
  const PanduanSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Text(
              "Panduan Pencegahan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [CardPanduan(), CardPanduan(), CardPanduan()],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CardPanduan extends StatelessWidget {
  const CardPanduan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade300),
        ),
      ),
    );
  }
}

class WarnButton extends StatelessWidget {
  const WarnButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 42,
      child: ElevatedButton(
        onPressed: () async {
          Get.offNamed(RoutesName.ISOMAN_INTRO);
        },
        child: Icon(
          Icons.error,
          color: Colors.white,
          size: 32,
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          primary: Color(0xFFDE4C43),
          padding: EdgeInsets.all(12),
        ),
      ),
    );
  }
}

class CovidDataSection extends StatelessWidget {
  PreventHomeViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Data Covid19 Indonesia",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Kasus",
                    ),
                    Text(
                      viewModel.data.value.total.toString(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sembuh",
                    ),
                    Text(
                      viewModel.data.value.sembuh.toString(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Meninggal",
                    ),
                    Text(
                      viewModel.data.value.meninggal.toString(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Divider(),
              SizedBox(
                height: 18,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Selengkapnya",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        elevation: 0,
                        primary: Color(0xff389F6E),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0)))),
              ),
            ],
          )),
    );
  }
}

class RealDivider extends StatelessWidget {
  const RealDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      color: Colors.grey.shade400,
    );
  }
}

class GreetingSection extends StatelessWidget {
  final PreventHomeViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    viewModel.getUserName();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => Text(viewModel.userName.value,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold))),
          Text("Semoga Sehat Selalu"),
          SizedBox(
            height: 28,
          ),
          Text(
            "IsomanBangkit adalah aplikasi panduan pencegahan dan penanganan isolasi mandiri covid19, jika kamu merasa harus melakukan isoman tekan tombol merah dibawah layar.",
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
