import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:i_am_bored/screens/submissions_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAppScreen extends StatelessWidget {
  static const routeName = '/about-app';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 20,
        // toolbarHeight: kToolbarHeight / 1.2,
        toolbarHeight: kToolbarHeight / 1.3,
        elevation: 20,
        // backgroundColor: Theme.of(context),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.elliptical(40, 30),
        //     // top: Radius.circular(30),
        //   ),
        // ),
        title: Text('About App'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          // height: MediaQuery.of(context).size.height * 0.8,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "This app is created for productivity purposes. The main motive of this app is to recommend the users new activities to do in their free time to build new hobbies and skills! Activities can be saved for later use. A user can also add notes and add the activites in their phone calendar simply with Calendar button.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.4,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  onTap: () async {
                    if (await canLaunch('https://github.com/prabhaskumra'))
                      launch('https://github.com/prabhaskumra');
                  },
                  title: Text("App Credits:"),
                  // subtitle: Text("iOS and Android Developer:\nPrabhas Kumra"),
                  subtitle: SelectableLinkify(
                    text: "iOS and Android Developer:\nPrabhas Kumra",
                    onTap: () async {
                      if (await canLaunch('https://github.com/prabhaskumra'))
                        launch('https://github.com/prabhaskumra');
                    },
                    style: TextStyle(
                      color: Colors.blue,
                      // fontSize: fontsize / 1.2,
                      // fontStyle: FontStyle.normal,
                    ),
                    // textAlign: TextAlign.center,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  isThreeLine: true,
                  // trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  title: Text("Data fetched from:"),
                  // subtitle: Text("The Bored API\nDeveloper: Drew Thoennes"),
                  subtitle: SelectableLinkify(
                    text: "The Bored API\nDeveloper: Drew Thoennes",
                    onTap: () async {
                      if (await canLaunch(
                          'https://github.com/drewthoennes/Bored-API'))
                        launch('https://github.com/drewthoennes/Bored-API');
                    },
                    style: TextStyle(
                      color: Colors.blue,
                      // fontSize: fontsize / 1.2,
                      // fontStyle: FontStyle.normal,
                    ),
                    // textAlign: TextAlign.center,
                  ),
                  // subtitle: Text("Prabhas Kumra, "),
                  trailing: Icon(Icons.arrow_forward_ios),
                  isThreeLine: true,
                ),
                ListTile(
                  title: Text("Contribte in building the database:"),
                  // subtitle: Text("Prabhas Kumra, "),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).pushNamed(SubmissionScreen.routeName);
                  },
                  // isThreeLine: true,
                ),
                ListTile(
                  title: Text("Contact"),
                  // subtitle: Text("Prabhas Kumra, "),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () async {
                    if (await canLaunch('https://github.com/prabhaskumra'))
                      launch('https://github.com/prabhaskumra');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
