import 'package:flutter/material.dart';
import 'package:image_search/base/base_screen.dart';
import 'package:image_search/ui/detail/detail_view_model.dart';
import 'package:get/get.dart';

class DetailScreen extends BaseScreen<DetailViewModel> {
  DetailScreen({Key? key}) : super(key: key);
  static const routeName = '/detailArguments';

  @override
  void initDependency() {
    viewModel = Get.find<DetailViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    viewModel.getData(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Image.network(viewModel.img),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  "출처 : ${viewModel.site}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text("문서 작성 시간 : ${viewModel.date}")
              ],
            )
          ],
        ),
      ),
    );
  }
}
