import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_search/base/base_view_model.dart';
import 'package:image_search/data/model/image_data.dart';
import 'package:intl/intl.dart';

class DetailViewModel extends BaseViewModel with GetSingleTickerProviderStateMixin {
  static DetailViewModel get to => Get.find();

  String date = "";
  String site = "";
  String img = "";
  String url = "";

  void getData(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Images;

    img = args.imgUrl!;
    site = args.siteName!;
    date = _convertDateTime(args.datetime!);
    url = args.docUrl!;
  }

  String _convertDateTime(String dateTime) {
    final date = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(dateTime);
    return DateFormat('yyyy년 MM월 dd일').format(date);
  }

}