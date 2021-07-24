import 'package:flutter/material.dart';
import 'package:isomanbangkit/components/IBAppBar.dart';
import 'package:isomanbangkit/components/IBButtonAccent.dart';

class IsomanHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff389F6E),
      appBar: getIBAppBar(
          logoColored: false,
          backgroundColor: Color(0xff389F6E),
          border: false),
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
  const GreetingSection({
    Key? key,
  }) : super(key: key);

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
          Text("8 Hari Lagi",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
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
  const DayRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DayColumn(
            day: "Sen",
          ),
          DayColumn(
            day: "Sel",
          ),
          DayColumn(
            day: "Rab",
          ),
          DayColumn(
            day: "Kam",
          ),
          DayColumn(
            day: "Jum",
          ),
          DayColumn(
            day: "Sab",
          ),
          DayColumn(
            day: "Min",
          ),
        ],
      ),
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
  const DayColumn({required this.day});

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
              color: Colors.black.withOpacity(0.2), shape: BoxShape.circle),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2), shape: BoxShape.circle),
        )
      ],
    );
  }
}
