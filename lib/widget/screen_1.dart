
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../common/utils.dart';

class ScreenOne extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 10),
                Utils.previousButton(),
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      widgetIndicator: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          color: Colors.green,
                          border: Border.all(color: Colors.grey.withOpacity(.5)),
                        ),
                        child: const Center(
                          child: Text(
                            "0.0%",
                            style: TextStyle(fontSize: 8, color: Colors.white, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      animation: true,
                      lineHeight: 3,
                       animationDuration: 500,
                      percent: 0.0,
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Colors.green.withOpacity(.5),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Utils.nextButton(),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

}
