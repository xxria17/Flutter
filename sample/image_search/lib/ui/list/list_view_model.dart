import 'package:get/get.dart';
import 'package:image_search/base/base_view_model.dart';
import 'package:image_search/data/model/image_data.dart';
import 'package:image_search/data/repository/list_api.dart';

import '../../main.dart';

class ListViewModel extends BaseViewModel
    with GetSingleTickerProviderStateMixin {
  static ListViewModel get to => Get.find();

  late ListApi _api;
  RxList<dynamic> imgList = <Images>[].obs;
  int page = 1;
  RxBool isMoreRequesting = false.obs;

  @override
  void onInit() {
    super.onInit();

    _api = Get.find<ListApi>();
  }

  void getImgs(String input) {
    imgList.clear();
    page = 1;
    isMoreRequesting = true.obs;
    _api.getResultList(page: page, query: input).then((value) {
      if (value.data != null) {
        imgList.addAll(value.data!);
      } else {
        print("ListViewModel value is null :: $value");
      }
    }).onError((error, stackTrace) {
      logger.e("api error", error, stackTrace);
    });
    isMoreRequesting = false.obs;
  }

  void loadMore(String input) {
    isMoreRequesting = true.obs;
    page++;
    _api.getResultList(page: page, query: input).then((value) {
      imgList.addAll(value.data!);
    }).onError((error, stackTrace) {
      logger.e("load more api error", error, stackTrace);
    });
    isMoreRequesting = false.obs;
  }

}
