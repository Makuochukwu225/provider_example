import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:provider_example/src/model/game.dart';
import 'package:provider_example/src/services/movie_api.dart';

class MovieProvider extends ChangeNotifier {
  List<MovieModel>? _model = [];
  List<MovieModel>? get model => _model;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _hasData = false;
  bool get hasData => _hasData;

  fetchData() async {
    try {
      _isLoading = true;
      notifyListeners();
      var data = await MovieApi.fetchMovie();

      if (data.status == "success") {
        var dataLength = jsonDecode(data.data).length;
        for (var i = 0; i < dataLength; i++) {
          _model!.add(MovieModel.fromJson(jsonDecode(data.data)[i]));
        }
        _hasData = true;
        _isLoading = false;
        notifyListeners();
      } else {
        _model = [];
        _isLoading = false;
        _hasData = false;
        notifyListeners();
      }
    } catch (e) {
      _model = [];
      _isLoading = false;
      _hasData = false;
      notifyListeners();
      log(e.toString());
    }
  }
}
