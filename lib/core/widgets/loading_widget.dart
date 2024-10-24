import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class WelcomeLoadingWidget extends StatelessWidget {
  const WelcomeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        alignment: Alignment.center,
        child:
            //      LinearProgressIndicator(
            //   backgroundColor: Colors.grey[200],
            //   color: Colors.black,
            //   borderRadius: BorderRadius.circular(8),
            //   minHeight: 30,

            // )
            CircularPercentIndicator(
          radius: 80,
          percent: 1,
          animation: true,
          lineWidth: 20,
          backgroundColor: Colors.grey.shade300,
          progressColor: Colors.black,
          circularStrokeCap: CircularStrokeCap.round,
          animationDuration: 1000,
          curve: Curves.easeInOutCubicEmphasized,
          restartAnimation: true,
          center: const Text(
            "Welcome",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          // onAnimationEnd: () => Navigator.of(context).push(
          // MaterialPageRoute(
          //   builder: (context) => const HomePage(),
          // ),
          // ),
          // center: const Text(
          //   "100 %",
          //   style: TextStyle(
          //     fontSize: 30,
          //   ),
          // ),
        ),
      ),
    );
  }
}
