import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isomanbangkit/components/IBAppBar.dart';
import 'package:isomanbangkit/components/IBButtonAccent.dart';
import 'package:isomanbangkit/routes/routes_name.dart';
import 'package:isomanbangkit/view_model/isoman/isoman_home_view_model.dart';

class IsomanHomeView extends StatelessWidget {
  IsomanHomeViewModel viewModel = Get.put(IsomanHomeViewModel());

  @override
  Widget build(BuildContext context) {
    viewModel.getDaysLeft();
    return Scaffold(
      backgroundColor: Color(0xff389F6E),
      appBar: getIBAppBar(
          logoColored: false,
          backgroundColor: Color(0xff389F6E),
          border: false,
          actions: [
            GestureDetector(
                onTap: () {
                  viewModel.quitIsoman();
                  Get.offNamed(RoutesName.PREVENT_HOME);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.logout),
                ))
          ]),
      body: ListView(
        children: [
          GreetingSection(),
          DayRow(),
          PanduanSection(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                StepButton(),
                SizedBox(
                  height: 18,
                ),
                StepButton()
              ],
            ),
          ),
          SizedBox(
            height: 48,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: IBButtonAccent("Test Gejala",
                color: Color(0xff4BB481),
                textColor: Colors.white,
                onPressed: () {}),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: IBButtonAccent("Telpon & Link Cepat", onPressed: () {}),
          ),
        ],
      ),
    );
  }
}

class StepButton extends StatelessWidget {
  const StepButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Panduan Isolasi Mandiri",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(
          width: 12,
        ),
        Icon(
          Icons.chevron_right,
          color: Colors.white,
        )
      ],
    );
  }
}

class GreetingSection extends StatelessWidget {
  IsomanHomeViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sabtu 24 Juli 2021",
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          Obx(() => Text("${viewModel.dayOn.value} Hari Lagi",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
          SizedBox(
            height: 34,
          ),
          Text(
              "Tetaplah tenang, Jaga imunitas, bersabarlah dan mohonlah pertolongan kepada Yang Maha Esa.",
              style: TextStyle(fontSize: 18, color: Colors.white)),
        ],
      ),
    );
  }
}

class DayRow extends StatelessWidget {
  IsomanHomeViewModel viewModel = Get.put(IsomanHomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Obx(() => Row(
            //crossAxisAlignment: CrossAxisAlignment,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DayColumn(
                day: "Sen",
                week1: viewModel.listDayAsBoolean[0],
                week2: viewModel.listDayAsBoolean[7],
              ),
              DayColumn(
                  day: "Sel",
                  week1: viewModel.listDayAsBoolean[1],
                  week2: viewModel.listDayAsBoolean[8]),
              DayColumn(
                  day: "Rab",
                  week1: viewModel.listDayAsBoolean[2],
                  week2: viewModel.listDayAsBoolean[9]),
              DayColumn(
                  day: "Kam",
                  week1: viewModel.listDayAsBoolean[3],
                  week2: viewModel.listDayAsBoolean[10]),
              DayColumn(
                  day: "Jum",
                  week1: viewModel.listDayAsBoolean[4],
                  week2: viewModel.listDayAsBoolean[11]),
              DayColumn(
                  day: "Sab",
                  week1: viewModel.listDayAsBoolean[5],
                  week2: viewModel.listDayAsBoolean[12]),
              DayColumn(
                  day: "Min",
                  week1: viewModel.listDayAsBoolean[6],
                  week2: viewModel.listDayAsBoolean[13]),
            ],
          )),
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
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [CardPanduan(), CardPanduan(), CardPanduan()],
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
      padding: const EdgeInsets.only(
        left: 16,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white.withOpacity(0.15)),
        ),
      ),
    );
  }
}

class DayColumn extends StatelessWidget {
  final String day;
  final bool week1, week2;
  const DayColumn({required this.day, this.week1 = false, this.week2 = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          day,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: (week1) ? Colors.white : Colors.black.withOpacity(0.2),
              shape: BoxShape.circle),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: (week2) ? Colors.white : Colors.black.withOpacity(0.2),
              shape: BoxShape.circle),
        )
      ],
    );
  }
}
