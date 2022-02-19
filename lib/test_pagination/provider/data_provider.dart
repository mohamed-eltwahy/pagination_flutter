import 'package:flutter/cupertino.dart';
import 'package:infinite_list_pagination/test_pagination/models/data_model.dart';
import '../api_service.dart';

enum LoadMoreStatus { LOADING, STABLE }

class DataProvider with ChangeNotifier {
 late APIService _apiService;
late DataModel _dataFetcher;
  int totalPages = 0;
  int pageSize = 25;

  List<Data>? get allUsers => _dataFetcher.data;
  double get totalRecords => _dataFetcher.totalPages!.toDouble();

  LoadMoreStatus _loadMoreStatus = LoadMoreStatus.STABLE;
  getLoadMoreStatus() => _loadMoreStatus;

  DataProvider() {
    _initStreams();
  }

  void _initStreams() {
    _apiService = APIService();
    _dataFetcher = DataModel();
  }

  void resetStreams() {
    _initStreams();
  }

  fetchAllUsers(pageNumber) async {
    if ((totalPages == 0) || pageNumber <= totalPages) {   
      DataModel itemModel =
          await _apiService.getData(pageNumber);
      if (_dataFetcher.data == null) {
        totalPages =  ((itemModel.totalPages! - 1) / pageSize).ceil();        
        _dataFetcher = itemModel;
      } else {        
        _dataFetcher.data!.addAll(itemModel.data!);
        _dataFetcher = _dataFetcher;

        // One load more is done will make it status as stable.
        setLoadingState(LoadMoreStatus.STABLE);        
      }      

      notifyListeners();
    }
    
    if(pageNumber > totalPages){
      // One load more is done will make it status as stable.
      setLoadingState(LoadMoreStatus.STABLE);      
      notifyListeners();
    }    
  }

  setLoadingState(LoadMoreStatus loadMoreStatus) {
    _loadMoreStatus = loadMoreStatus;
    notifyListeners();
  }
}
