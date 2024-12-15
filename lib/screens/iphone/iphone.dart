import 'package:flutter/material.dart';
import 'package:minggu4/screens/iphone/all_iphone.dart';
import 'package:minggu4/screens/iphone/eleven_series.dart';
import 'package:minggu4/screens/iphone/twelve_series.dart';

class IphoneScreen extends StatefulWidget {
  const IphoneScreen({super.key});

  @override
  State<IphoneScreen> createState() => _IphoneScreenState();
}

class _IphoneScreenState extends State<IphoneScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Iphone"),
            centerTitle: true,
            bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                tabs: [
                  Tab(child: Text("All")),
                  Tab(child: Text("11 Series")),
                  Tab(child: Text("12 Series")),
                  Tab(child: Text("13 Series")),
                  Tab(child: Text("14 Series")),
                  Tab(child: Text("15 Series")),
                ]),
          ),
          body: const TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                AllIphoneScreen(),
                ElevenSeriesScreen(),
                TwelveSeriesScreen(),
                ElevenSeriesScreen(),
                ElevenSeriesScreen(),
                ElevenSeriesScreen(),
              ]),
        ));
  }
}
