import 'package:flutter/material.dart';
import 'package:minggu4/screens/iphone/eleven_series.dart';
import 'package:minggu4/screens/iphone/twelve_series.dart';

class AllIphoneScreen extends StatelessWidget {
  const AllIphoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ElevenSeriesScreen(), TwelveSeriesScreen()],
      ),
    );
  }
}
