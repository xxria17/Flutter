import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:image_search/base/base_stateful_screen.dart';
import 'package:image_search/data/model/image_data.dart';
import 'package:image_search/ui/detail/detail_view.dart';

import 'list_view_model.dart';

class ListScreen extends BaseStatefulScreen<ListViewModel> {
  ListScreen({Key? key}) : super(key: key);

  @override
  void initDependency() {}

  @override
  State<StatefulWidget> createState() => _ListScreen();
}

class _ListScreen extends State<ListScreen> {
  late ScrollController _scrollController;
  late TextEditingController _textController;
  late ListViewModel viewModel;

  bool _isComposing = false;

  @override
  void initState() {
    super.initState();
    viewModel = Get.find<ListViewModel>();

    _scrollController = ScrollController();
    _textController = TextEditingController();

    _scrollController.addListener(() {
      if(_scrollController.offset >=
      _scrollController.position.maxScrollExtent &&
      !_scrollController.position.outOfRange) {
        viewModel.loadMore(_textController.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _textController,
                  onChanged: (text) {
                    setState(() {
                      _isComposing = text.isNotEmpty;
                    });
                  },
                  style: const TextStyle(color: Colors.blue),
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(hintText: '검색어를 입력하세요.'),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                    icon: const Icon(Icons.send),
                    color: Colors.blue,
                    onPressed: _isComposing
                        ? () => {_handleSubmitted(_textController.text)}
                        : null),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            GetX<ListViewModel>(
                init: viewModel,
                builder: (controller) =>
                    controller.initialized && controller.imgList.isNotEmpty
                        ? GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3, childAspectRatio: 1 / 1),
                            itemBuilder: (BuildContext context, int idx) {
                              return GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, DetailScreen.routeName,
                                    arguments: Images(
                                        viewModel.imgList[idx]['imgUrl'],
                                        viewModel.imgList[idx]['thumbnailUrl'],
                                        viewModel.imgList[idx]['siteName'],
                                        viewModel.imgList[idx]['dateTime'])),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      viewModel.imgList[idx]['thumbnailUrl'],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            },
                            controller: _scrollController,
                          )
                        : const Text('데이터가 없습니다.',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center)),
            viewModel.isMoreRequesting.value
                ? Container(
                    height: 50.0,
                    color: Colors.white,
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    color: Colors.white,
                    child: const Center(),
                  )
          ],
        ));
  }

  void _handleSubmitted(String input) {
    FocusScope.of(context).unfocus();
    setState(() {
      _isComposing = false;
    });
    viewModel.getImgs(input);
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
