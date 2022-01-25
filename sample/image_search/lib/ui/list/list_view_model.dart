import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_search/base/base_view_model.dart';
import 'package:image_search/data/model/image_data.dart';
import 'package:image_search/data/repository/list_api.dart';

import '../../main.dart';

class ListViewModel extends BaseViewModel
    with GetSingleTickerProviderStateMixin {
  static ListViewModel get to => Get.find();

  late ListApi _api;
  RxList<Images> imgList = <Images>[].obs;
  int page = 1;
  // RxBool isMoreRequesting = false.obs;
  RxList<bool> isMoreRequesting = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();

    _api = Get.find<ListApi>();
  }

  void getImgs(String input) {
    imgList.clear();
    page = 1;
    _api.getResultList(page: page, query: input).then((value) {
      imgList.addAll(value.data ?? []);
    }).onError((error, stackTrace) {
      if (isContains(error!, "SocketException")) {
        showSnackBar("인터넷 연결을 확인해주세요.");
      } else if (isContains(error, "FormatException")) {
        showSnackBar("검색어를 다시 확인해주세요.");
      } else if (isContains(error, "404")) {
        showSnackBar("검색 주소를 다시 확인해주세요.");
      } else if (isContains(error, "401") || isContains(error, "403")) {
        showSnackBar("권한을 다시 확인해주세요.");
      } else if (isContains(error, "500") || isContains(error, "502") || isContains(error, "503")) {
        showSnackBar("잠시후에 다시 시도해주세요.");
      } else {
        showSnackBar("잘못된 요청입니다.");
      }
      logger.e("list view model error", error, stackTrace);
    });
  }

  void loadMore(String input) {
    isMoreRequesting.add(true);
    page++;
    _api.getResultList(page: page, query: input).then((value) {
      if (value.metaData!.isEnd!) {
        showSnackBar("더 표시할 내용이 없습니다.");
      } else {
        imgList.addAll(value.data!);
        isMoreRequesting.add(false);
      }
    }).onError((error, stackTrace) {
      logger.e("load more api error", error, stackTrace);
    });
  }

  void showSnackBar(String msg) {
    Get.snackbar(msg, "",
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.black,
    backgroundColor: Colors.white);
  }

  bool isContains(Object error, String type) {
    return error.toString().contains(type);
  }

}
