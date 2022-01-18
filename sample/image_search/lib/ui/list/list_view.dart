import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_search/base/base_screen.dart';
import 'list_view_model.dart';

class ListScreen extends BaseScreen<ListViewModel> {
  ListScreen({Key? key}): super(key: key);

  @override
  void initDependency() {
    viewModel = Get.find<ListViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: viewModel?.textController,
                    onChanged: (text) {
                      setState(() {
                        _isComposing = text.isNotEmpty;
                      });
                    },
                    onSubmitted: _isComposing ? _handleSubmitted : null,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(hintText: '검색어를 입력하세요.'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _isComposing
                        ? () =>
                    {
                      _handleSubmitted(viewModel?.textController),
                      data.clear()
                    }
                        : null,
                  ),
                )
              ],
            )),
        body: Container(
            child: _downloading
                ? SizedBox(
                height: 120.0,
                width: 200.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [CircularProgressIndicator()],
                ))
                : Center(
              child: data.isEmpty
                  ? const Text(
                '데이터가 없습니다.',
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              )
                  : GridView.builder(
                itemCount: data.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => _goToDetail(
                        data[index]['image_url'],
                        context,
                        data[index]['display_sitename'],
                        data[index]['datetime']),
                    child: Image.network(
                      data[index]['image_url'],
                      fit: BoxFit.fill,
                    ),
                  );
                },
                controller: viewModel?.scrollController,
              ),
            ))
    );
  }
}