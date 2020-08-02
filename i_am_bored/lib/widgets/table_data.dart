import 'package:flutter/material.dart';

import '../models/bored_https_call.dart';
import '../models/bored_data.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

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
    // return Table(
    //   // border: TableBorder.all(
    //   //     // color: Colors.green,
    //   //     // width: 10,
    //   //     ),
    //   children: [
    //     TableRow(
    //       decoration: BoxDecoration(
    //           // color: Colors.yellow,
    //           ),
    //       children: [
    //         SelectableText(
    //           value.activity,
    //           style: TextStyle(fontSize: fontsize),
    //           textAlign: TextAlign.center,
    //         ),
    //       ],
    //     ),
    //     //Second Row
    //     TableRow(
    //       children: [
    //         Text(
    //           value.type,
    //           style: TextStyle(
    //             fontSize: fontsize,
    //             fontStyle: FontStyle.italic,
    //             color: Colors.grey,
    //             // decorationStyle: TextDecorationStyle.wavy,
    //           ),
    //           textAlign: TextAlign.center,
    //         )
    //       ],
    //     ),
    //     TableRow(
    //       children: [
    //         if (value.link == '')
    //           Text(
    //             "No link",
    //             style: TextStyle(
    //               fontSize: fontsize,
    //             ),
    //             textAlign: TextAlign.center,
    //           )
    //         else
    //           SelectableLinkify(
    //             text: value.link,
    //             onTap: () async {
    //               if (await canLaunch(value.link)) launch(value.link);
    //             },
    //             style: TextStyle(
    //               fontSize: fontsize / 1.2,
    //             ),
    //             textAlign: TextAlign.center,
    //           ),
    //       ],
    //     ),
    //   ],
    // );

    return Column(
      children: <Widget>[
        Container(
          height: 60,
          child: SelectableText(
            value.activity,
            style: TextStyle(
              fontSize: fontsize,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Divider(),
        Text(
          value.type,
          style: TextStyle(
            fontSize: fontsize,
            fontStyle: FontStyle.italic,
            color: Colors.grey,
            // decorationStyle: TextDecorationStyle.wavy,
          ),
          textAlign: TextAlign.center,
        ),
        //             if (value.link == '')
        //   Text(
        //     "No link",
        //     style: TextStyle(
        //       fontSize: fontsize,
        //     ),
        //     textAlign: TextAlign.center,
        //   )
        // else
        SelectableLinkify(
          text: value.link,
          onTap: () async {
            if (await canLaunch(value.link)) launch(value.link);
          },
          style: TextStyle(
              // fontSize: fontsize / 1.2,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
