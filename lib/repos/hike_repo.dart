import 'package:get_it/get_it.dart';
import 'package:inovolatask/models/course_model.dart';
import 'package:inovolatask/utils/network_base.dart';

import '../constants.dart';

//Repository class that interacts with the API and responsible for fetching the data from a remote API.
class HikeRepository {
  Future<HikeModel> getCourseData() async {
    final result =
        await GetIt.instance<NetworkBaseAPI>().makeGetRequest(kAPIEndPoint);
    if (result != null) return HikeModel.fromJson(result);
    return HikeModel();
  }
}
