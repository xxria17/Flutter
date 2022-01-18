import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_search/base/base_view_model.dart';
import 'package:image_search/main.dart';

class ListViewModel extends BaseViewModel with GetSingleTickerProviderStateMixin {
  static ListViewModel get to => Get.find();

  late ScrollController scrollController;
  late TextEditingController textController;

  @override
  void onInit() {
    super.onInit();

    scrollController = ScrollController();
    textController = TextEditingController();

  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}