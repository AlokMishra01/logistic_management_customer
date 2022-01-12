// import 'dart:developer';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:logistic_management_customer/models/request_model.dart';
// import 'package:logistic_management_customer/services/api_service/client.dart';
//
// import '../constants/apis.dart' as apis;
// import '../services/connectivity/network_connection.dart';
//
// class RequestProvider extends ChangeNotifier {
//   NetworkConnection _network = NetworkConnection();
//   Dio _dio = Dio();
//   String _error = '';
//   List<RequestModel> _pendingList = <RequestModel>[];
//   List<RequestModel> _approvedList = <RequestModel>[];
//
//   RequestProvider(this._network) {
//     _dio = Client().init();
//     // fetchPending();
//     // fetchApproved();
//   }
//
//   fetchPending({required int userId}) async {
//     if (_network.hasInternet) {
//       try {
//         Response r = await _dio.get('${apis.REQUEST_PENDING}/$userId');
//
//         log(r.data.toString(), name: 'PENDING');
//
//         if (r.statusCode! == 200) {
//           _pendingList = List<RequestModel>.from(
//             r.data['response'].map((m) => RequestModel.fromJson(m)),
//           );
//         } else {
//           _error = r.statusMessage ??
//               'Oops! Some thing went wrong. Please try again.';
//         }
//       } catch (e) {
//         if (e is DioError) {
//           _error = e.message;
//           log(e.message, name: 'RequestProvider.fetchPending');
//         } else {
//           _error = 'Oops! Some thing went wrong. Please try again.';
//           log(e.toString(), name: 'RequestProvider.fetchPending');
//         }
//       }
//     } else {
//       _error = 'No internet connection. Please connect to internet.';
//     }
//     notifyListeners();
//   }
//
//   fetchApproved({required int userId}) async {
//     if (_network.hasInternet) {
//       try {
//         Response r = await _dio.get('${apis.REQUEST_APPROVED}/$userId');
//
//         log(r.data.toString(), name: 'APPROVED');
//
//         if (r.statusCode! == 200) {
//           _approvedList = List<RequestModel>.from(
//             r.data['response'].map((m) => RequestModel.fromJson(m)),
//           );
//         } else {
//           _error = r.statusMessage ??
//               'Oops! Some thing went wrong. Please try again.';
//         }
//       } catch (e) {
//         if (e is DioError) {
//           _error = e.message;
//           log(e.message, name: 'RequestProvider.fetchApproved');
//         } else {
//           _error = 'Oops! Some thing went wrong. Please try again.';
//           log(e.toString(), name: 'RequestProvider.fetchApproved');
//         }
//       }
//     } else {
//       _error = 'No internet connection. Please connect to internet.';
//     }
//     notifyListeners();
//   }
//
//   // Getters
//   String get error => _error;
//   List<RequestModel> get pendingList => _pendingList;
//   List<RequestModel> get approvedList => _approvedList;
// }
