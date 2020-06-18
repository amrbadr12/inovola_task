import 'package:flutter/foundation.dart';
import 'package:inovolatask/models/course_model.dart';
import 'package:inovolatask/repos/hike_repo.dart';

//Reactive provider class that binds the data to the UI according to the model.
class HikeModelProvider with ChangeNotifier {
  final HikeRepository _hikeRepo;
  HikeModel _hikeModel;
  bool _showLoad;
  int _currentImagePageIndex;

  HikeModelProvider(this._hikeRepo) {
    _showLoad = false;
    _currentImagePageIndex = 0;
    _getCourseData();
  }

  bool get load => _showLoad;
  int get currentImagePageIndex => _currentImagePageIndex;
  HikeModel get currentHikeModel => _hikeModel;

  //Sets the loading indicator status
  _setShowLoading(bool load) {
    _showLoad = load;
    notifyListeners();
  }

  //Sets the dots indicator index in the appbar.
  setImageIndex(int index) {
    _currentImagePageIndex = index;
    notifyListeners();
  }

  //Getting the actual hike date from the remote API then binding it to the UI.
  _getCourseData() async {
    if (_hikeRepo != null) {
      try {
        _setShowLoading(true);
        _hikeModel = await _hikeRepo.getCourseData();
        notifyListeners();
      } catch (e) {
        print('Some error happened while fetching the data.');
      } finally {
        _setShowLoading(false);
      }
    }
  }
}
