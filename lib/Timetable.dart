import 'package:flutter/material.dart';

class TimetablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Card(
            //   child: Padding(
            //     padding: EdgeInsets.all(16),
            //     child: Container(
            //       child: <Widget>[
            //         Row(
            //           children: [
            //             Text('test')
            //           ],
            //         )
            //       ],
            //     ),
            //   ),
            // )

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // 圆角
              ),
              elevation: 5, // 阴影高度
              shadowColor: Colors.grey.withOpacity(0.5),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_month),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Class", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.pin_drop),
                                    Text("Block DK")
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.lock_clock),
                                    Text("4 - 6PM")
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}