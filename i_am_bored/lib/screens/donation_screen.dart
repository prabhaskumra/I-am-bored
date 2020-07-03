import 'package:flutter/material.dart';

class DonationScreen extends StatelessWidget {
  static const routeName = '/donate';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        // backgroundColor: Theme.of(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(40, 30),
            // top: Radius.circular(30),
          ),
        ),
        title: Text('Donation'),
      ),
    );
  }
}
