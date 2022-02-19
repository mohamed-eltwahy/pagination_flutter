import 'package:flutter/cupertino.dart';
import 'package:infinite_list_pagination/model/passenger_data.dart';

import '../myDio.dart';

class HomeProvider extends ChangeNotifier {
  bool _isloading = false;

  bool get isloading => _isloading;

  late List<dynamic> _passengers;
  List<dynamic> get passengers => [..._passengers];

  int currentPage = 1;
   int totalPages=0;

  Future<dynamic> getalldata({bool isRefresh = false}) async {
    // _isloading = true;
     if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        // refreshController.loadNoData();
        return false;
      }
    }
    // notifyListeners();
    _passengers = [];
    Map<dynamic, dynamic> getalldatafromapi = await myDio(
      url:
          'https://api.instantwebtools.net/v1/passenger?page=$currentPage&size=10',
      methodType: 'get',
      appLanguage: 'ar',
    );
    totalPages = getalldatafromapi['data']['totalPages'];

    print('totaaaaaaaaaaaaallll' + totalPages.toString());

    print('get all dT fromapi' + getalldatafromapi['data']['data'].toString());

    if (isRefresh) {
      _passengers = (getalldatafromapi['data']['data'])
          .map<Data>((i) => Data.fromJson(i))
          .toList();
    } else {
      passengers.addAll(_passengers);
    }

    currentPage++;
    _isloading = false;
    notifyListeners();
    return getalldatafromapi;
  }
}
