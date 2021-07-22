import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logistic_management_customer/models/package_model.dart';
import 'package:logistic_management_customer/services/api_service/client.dart';

import '../constants/apis.dart' as apis;
import '../services/connectivity/network_connection.dart';

class DeliveryProvider extends ChangeNotifier {
  NetworkConnection _network = NetworkConnection();
  Dio _dio = Dio();
  bool _initilizing = true;
  // bool _loadingMore = false;
  // bool _canLoadMore = true;
  String _error = '';
  // int _page = 1;
  List<PackageModel> _packages = <PackageModel>[];

  DeliveryProvider(this._network) {
    _dio = Client().init();
    fetchPackage(
      init: true,
      // reload: true,
    );
  }

  fetchPackage({
    bool init = false,
    // bool reload = false,
  }) async {
    _error = '';
    // if (reload) {
    //   _page = 1;
    //   _loadingMore = false;
    //   _canLoadMore = true;
    // } else {
    //   _loadingMore = true;
    // }
    if (init)
      _initilizing = true;
    else
      notifyListeners();

    if (_network.hasInternet) {
      try {
        Response r = await _dio.get('${apis.PACKAGE}');

        if (r.statusCode! >= 200 && r.statusCode! < 300) {
          if (r.data['response'] is Map) {
            List<PackageModel> p = List<PackageModel>.from(
              r.data['response']['packages'].map(
                (m) => PackageModel.fromJson(m),
              ),
            );
            _packages.clear();
            _packages.addAll(p);
            // if (reload)
            //   _blogs = blogs;
            // else
            //   _blogs.addAll(blogs);
            //
            // if (r.data['next_page_url'] != null) {
            //   _page = _page + 1;
            // } else {
            //   _canLoadMore = false;
            // }
          } else {
            _error = r.data['message'] as String;
          }
        }
      } catch (e) {
        if (e is DioError) {
          _error = e.message;
          log(e.message, name: 'DeliveryProvider.fetchPackage');
        } else {
          _error = 'Oops! Some thing went wrong. Please try again.';
          log(e.toString(), name: 'DeliveryProvider.fetchPackage');
        }
      }
    } else {
      _error = 'No internet connection. Please connect to internet.';
    }
    _initilizing = false;
    notifyListeners();
  }

  dynamic requestDelivery({
    required String senderName,
    required String senderAddress,
    required String senderPhone,
    required double senderLat,
    required double senderLong,
    required String receiverName,
    required String receiverAddress,
    required String receiverPhone,
    required double receiverLat,
    required double receiverLong,
    required String packageType,
    required String packageWeight,
    required String packageSize,
    required String pickUpTime,
    required String dropOffTime,
    required int fragile,
    required int express,
  }) async {
    if (_network.hasInternet) {
      try {
        Response response = await _dio.post(apis.REQUEST_DELIVERY, data: {
          'sender_name': senderName,
          'sender_address': senderAddress,
          'sender_mobileno': senderPhone,
          'sender_lat': senderLat,
          'sender_lon': senderLong,
          'reciever_name': receiverName,
          'reciever_address': receiverAddress,
          'reciever_mobileno': receiverPhone,
          'reciever_lat': receiverLat,
          'reciever_lon': receiverLong,
          'package_type': packageType,
          'package_weight': packageWeight,
          'package_size': packageSize,
          'pickup_time': pickUpTime,
          'dropoff_time': dropOffTime,
          'fragile': fragile,
          'express': express,
        });
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          if (response.statusCode == 200) {
            return true;
          } else
            return response.data['message'];
        } else {
          return response.statusMessage;
        }
      } catch (error) {
        if (error is DioError) {
          log(
            error.message,
            name: 'Request Delivery Error',
          );
          return error.message;
        } else {
          log(
            error.toString(),
            name: 'Request Delivery Error',
          );
          return error.toString();
        }
      }
    } else {
      return 'No internet connection. Please connect to internet.';
    }
  }

  // Getters
  bool get initilizing => _initilizing;
  // bool get loadingMore => _loadingMore;
  // bool get canLoadMore => _canLoadMore;
  String get error => _error;
  List<PackageModel> get packages => _packages;
}
