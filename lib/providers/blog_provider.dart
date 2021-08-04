import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logistic_management_customer/services/api_service/client.dart';
import 'package:pretty_json/pretty_json.dart';

import '../constants/apis.dart' as apis;
import '../models/blog_model.dart';
import '../services/connectivity/network_connection.dart';

class BlogProvider extends ChangeNotifier {
  NetworkConnection _network = NetworkConnection();
  Dio _dio = Dio();
  bool _initilizing = true;
  bool _loadingMore = false;
  bool _canLoadMore = true;
  String _error = '';
  int _page = 1;
  List<BlogModel> _blogs = <BlogModel>[];

  BlogProvider(this._network) {
    _dio = Client().init();
    fetchBlogs(init: true, reload: true);
  }

  fetchBlogs({bool init = false, bool reload = false}) async {
    _error = '';
    if (reload) {
      _page = 1;
      _loadingMore = false;
      _canLoadMore = true;
    } else {
      _loadingMore = true;
    }
    if (init)
      _initilizing = true;
    else
      notifyListeners();

    if (_network.hasInternet) {
      try {
        Response r = await _dio.get('${apis.BLOGS}?page=$_page');

        if (r.statusCode! == 200) {
          if (r.data['response'] is Map) {
            print(r.data['response']['data'].toString());
            List<BlogModel> blogs = List<BlogModel>.from(
              r.data['response']['data'].map((m) => BlogModel.fromJson(m)),
            );
            if (reload)
              _blogs = blogs;
            else
              _blogs.addAll(blogs);

            if (r.data['next_page_url'] != null) {
              _page = _page + 1;
            } else {
              _canLoadMore = false;
            }
          } else {
            _error = r.data['message'] as String;
          }
        } else {
          _error = r.statusMessage ??
              'Oops! Some thing went wrong. Please try again.';
        }
      } catch (e) {
        if (e is DioError) {
          _error = e.message;
          log(e.message, name: 'BlogProvider.fetchBlogs');
        } else {
          _error = 'Oops! Some thing went wrong. Please try again.';
          log(e.toString(), name: 'BlogProvider.fetchBlogs');
        }
      }
    } else {
      _error = 'No internet connection. Please connect to internet.';
    }
    _initilizing = false;
    notifyListeners();
  }

  dynamic getBlogDetail({required int id}) async {
    if (_network.hasInternet) {
      try {
        Response r = await _dio.get('${apis.BLOGS}/$id');
        if (r.statusCode! >= 200 && r.statusCode! < 300) {
          log(prettyJson(r.data), name: 'BlogProvider.getBlogDetail{$id}');
          return BlogModel.fromJson(r.data);
        } else {
          log(r.statusMessage ?? '', name: 'BlogProvider.getBlogDetail{$id}');
          return r.statusMessage ?? '';
        }
      } catch (e) {
        if (e is DioError) {
          _error = e.message;
          log(e.message, name: 'BlogProvider.getBlogDetail{$id}');
        } else {
          _error = 'Oops! Some thing went wrong. Please try again.';
          log(e.toString(), name: 'BlogProvider.getBlogDetail{$id}');
        }
      }
    } else {
      return 'No internet connection. Please connect to internet.';
    }
  }

  // Getters
  bool get initilizing => _initilizing;
  bool get loadingMore => _loadingMore;
  bool get canLoadMore => _canLoadMore;
  String get error => _error;
  List<BlogModel> get blogs => _blogs;
}
