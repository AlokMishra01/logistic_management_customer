import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/connectivity/network_connection.dart';

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
