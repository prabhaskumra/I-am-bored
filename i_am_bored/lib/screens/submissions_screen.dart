import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/services.dart';
import '../models/submissions_https.dart';

class SubmissionScreen extends StatefulWidget {
  @override
  _SubmissionScreenState createState() => _SubmissionScreenState();
  static const routeName = '/submissions';
}

class _SubmissionScreenState extends State<SubmissionScreen> {
  var val = 'Select';
  var participantsVal = "Select";

  var _activityTitleController = TextEditingController();
  var _linkController = TextEditingController();
  var _nameController = TextEditingController();
  var _emailController = TextEditingController();
  var _isLoading = false;

  // SystemChannels

  Future<void> _submitData() async {
    setState(() {
      _isLoading = true;
    });

    SubmissionsData activityCreated = new SubmissionsData(
      activity: _activityTitleController.text,
      type: val,
      participants: participantsVal,
      link: _linkController.text,
      name: _nameController.text,
      email: _emailController.text,
      price: '',
      accessibility: '',
    );

    await SubmissionsHttp().submitActivity(activityCreated);

    setState(() {
      _isLoading = false;
    });

    resetForm();
  }

  bool _isFilled() {
    if (_activityTitleController.text == '') return false;

    if (val == 'Select') return false;

    if (participantsVal == "Select") return false;

    return true;
  }

  void resetForm() {
    _activityTitleController.text = '';
    _linkController.text = '';
    _nameController.text = '';
    _emailController.text = '';
    val = "Select";
    participantsVal = 'Select';
  }

  static Future<void> vibrate() async {
    await SystemChannels.platform.invokeMethod<void>(
      'HapticFeedback.vibrate',
      'HapticFeedbackType.lightImpact',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help us out!"),
        toolbarHeight: kToolbarHeight / 1.3,
        elevation: 20,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          // height: MediaQuery.of(context).size.height * 0.8,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Help us out by sumbitting activities you'd like us to add into out database! Be a speacial part of Hobby-It community!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  height: (MediaQuery.of(context).size.height * .30) / 70,
                  // decoration: boxDecoration,
                  child: _isLoading
                      ? LinearProgressIndicator(
                          minHeight: 3,
                        )
                      : Divider(
                          color: Theme.of(context).primaryColor,
                          thickness: 3,
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          // initialValue: widget.receivedList[DatabaseHelper.notes],
                          // initialValue: _myTextController.text,
                          controller: _activityTitleController,
                          decoration: new InputDecoration(
                            labelText: 'Activity Title *',
                            hintText: 'Example: Learn to code in C++',
                            hintStyle: TextStyle(fontStyle: FontStyle.italic),
                            alignLabelWithHint: true,
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Type:"),
                          DropdownButton<String>(
                            value: val,
                            // hint: Text("TYpe"),
                            focusColor: Theme.of(context).primaryColor,
                            items: <String>[
                              "Select",
                              "Education",
                              "Recreational",
                              "Social",
                              "DIY",
                              "Charity",
                              "Cooking",
                              "Relaxation",
                              "Music",
                              "Busywork",
                              "Other",
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                val = newVal;
                              });
                            },
                          ),
                          VerticalDivider(),
                          Text("Participants:"),
                          DropdownButton<String>(
                            value: participantsVal,
                            // hint: Text("TYpe"),
                            focusColor: Theme.of(context).primaryColor,
                            items: <String>[
                              "Select",
                              "1",
                              "2",
                              "3",
                              "4",
                              "5",
                              "6",
                              "7",
                              "8",
                              "9",
                              "10",
                              ">10"
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                participantsVal = newVal;
                              });
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          // initialValue: widget.receivedList[DatabaseHelper.notes],
                          // initialValue: _myTextController.text,
                          controller: _linkController,

                          decoration: new InputDecoration(
                            labelText: 'Link (Optional)',
                            alignLabelWithHint: true,
                            // hintMaxLines: 2,
                            hintText: "Example: https://www.cplusplus.com",
                            hintStyle: TextStyle(fontStyle: FontStyle.italic),
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          keyboardType: TextInputType.url,
                          // style:,
                        ),
                      ),
                      Divider(),
                      // Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          // initialValue: widget.receivedList[DatabaseHelper.notes],
                          // initialValue: _myTextController.text,
                          controller: _nameController,

                          decoration: new InputDecoration(
                            labelText: 'Name (Optional)',
                            // hintText: 'Optional',
                            // alignLabelWithHint: true,
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          // initialValue: widget.receivedList[DatabaseHelper.notes],
                          // initialValue: _myTextController.text,
                          controller: _emailController,

                          decoration: new InputDecoration(
                            labelText: 'Email (Optional)',
                            alignLabelWithHint: true,
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          // style:,
                        ),
                      ),
                      Container(
                        // width: mediaQuery.size.width * 0.6,
                        // width: double.infinity,
                        // height: 45,
                        height: MediaQuery.of(context).size.height * .06,
                        // padding: EdgeInsets.all(8.0),

                        // decoration: boxDecoration,
                        child: RaisedButton.icon(
                          // shadowColor: Theme.of(context).primaryColorDark,
                          // elevation: 20,
                          // disabledColor: _activityTitleController.text == '' ? true : false,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            // side: BorderSide(
                            //   color: Theme.of(context).primaryColor,
                            //   // color:
                            // ),
                          ),

                          label: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          icon: Icon(
                            Icons.done,
                            color: Colors.white,
                          ),
                          onPressed: !_isFilled()
                              ? null
                              : () {
                                  vibrate();
                                  _submitData();
                                },
                          color: Theme.of(context).primaryColor,
                          // color: _activityTitleController.text == ''
                          //     ? Theme.of(context).disabledColor
                          //     : Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem buildDropdownMenuItem(String type) {
    return DropdownMenuItem(
      child: Text(type),
    );
  }
}
