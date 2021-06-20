import 'package:flutter/material.dart';
import 'package:logistic_management_customer/services/connectivity/network_connection.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${context.watch<NetworkConnection>().hasInternet}'),
      ),
    );
  }
}
