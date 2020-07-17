import 'package:flutter/material.dart';

import '../models/bored_https_call.dart';
import '../models/bored_data.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class TableData extends StatelessWidget {
  TableData({
    Key key,
    @required this.fontsize,
    @required this.value,
  }) : super(key: key);

  final double fontsize;
  BoredData value;

  // print(value);

  @override
  Widget build(BuildContext context) {
    return Table(
      // border: TableBorder.all(
      //     // color: Colors.green,
      //     // width: 10,
      //     ),
      children: [
        TableRow(
          decoration: BoxDecoration(
              // color: Colors.yellow,
              ),
          children: [
            // Text(
            //   'Activity',
            //   // value.key,
            //   style: TextStyle(fontSize: fontsize),
            //   textAlign: TextAlign.center,
            // ),

            SelectableText(
              value.activity,
              style: TextStyle(fontSize: fontsize),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        //Second Row
        TableRow(
          children: [
            // Text(
            //   "Type",
            //   style: TextStyle(
            //     fontSize: fontsize,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            Text(
              value.type,
              style: TextStyle(
                fontSize: fontsize,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
                // decorationStyle: TextDecorationStyle.wavy,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
        // TableRow(
        //   children: [
        //     Spacer(),
        //   ],
        // ),
        // Spacer(),
        // Third Row
        // TableRow(
        //   children: [
        //     Text(
        //       "Participants",
        //       style: TextStyle(
        //         fontSize: fontsize,
        //       ),
        //       textAlign: TextAlign.center,
        //     ),
        //     Text(
        //       value.participants.toString(),
        //       style: TextStyle(
        //         fontSize: fontsize,
        //       ),
        //       textAlign: TextAlign.center,
        //     ),
        //   ],
        // ),
        // 4th Row
        // TableRow(
        //   children: [
        //     Text(
        //       "Price",
        //       style: TextStyle(
        //         fontSize: fontsize,
        //       ),
        //       textAlign: TextAlign.center,
        //     ),
        //     Text(
        //       "\$ " + value.price.toString(),
        //       style: TextStyle(
        //         fontSize: fontsize,
        //       ),
        //       textAlign: TextAlign.center,
        //     )
        //   ],
        // ),
        // 5th Row
        TableRow(
          children: [
            // Text(
            //   "Websit Link",
            //   style: TextStyle(
            //     fontSize: fontsize,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            if (value.link == '')
              Text(
                "No link",
                style: TextStyle(
                  fontSize: fontsize,
                ),
                textAlign: TextAlign.center,
              )
            else
              // Text(
              //   value.link,
              //   style: TextStyle(
              //     fontSize: fontsize / 1.2,
              //   ),
              //   textAlign: TextAlign.center,
              //   // INSERT THE LINK
              // ),
              // Spacer(),
              SelectableLinkify(
                text: value.link,
                style: TextStyle(
                  fontSize: fontsize / 1.2,
                ),
                textAlign: TextAlign.center,
              ),

            // Text('hee'),
          ],
        ),
        // TableRow(
        //   children: [
        //     Text(
        //       "Accesibility",
        //       style: TextStyle(
        //         fontSize: fontsize,
        //       ),
        //       textAlign: TextAlign.center,
        //     ),
        //     Text(
        //       value.accessibility.toString(),
        //       style: TextStyle(
        //         fontSize: fontsize,
        //       ),
        //       textAlign: TextAlign.center,
        //     )
        //   ],
        // ),
      ],
    );
  }
}
