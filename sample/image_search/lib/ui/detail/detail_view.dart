import 'package:flutter/material.dart';
import 'package:image_search/base/base_screen.dart';
import 'package:image_search/ui/detail/detail_view_model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
            Image.network(
                viewModel.img,
            loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                      : null,
                    ),
                  );
            },),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                ),
                GestureDetector(
                  child: Center(
                    child: viewModel.site.trim().length > 1
                    ? Text(
                      "출처 : ${viewModel.site.trim()}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )
                    : null,
                  ),
                  onTap: _launchURL,
                ),
                Center(
                  child: viewModel.date.trim().length > 1
                    ? Text("문서 작성 시간 : ${viewModel.date}")
                  : null
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

   _launchURL() async {
    if (await canLaunch(viewModel.url)) {
      await launch(viewModel.url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch ${viewModel.url}';
    }
  }
}
