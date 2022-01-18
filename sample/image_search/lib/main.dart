import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const ImageSearchApp());
}

String imageUrl = "";
String sitename = "";
String datetime = "";

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Row(
          children: [
            ListView(
              children: [
                Image.network(imageUrl),
                Text(
                  "출처 : $sitename",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text("문서 작성 시간 : $datetime"),
              ],
            )
          ],
        ));
  }
}

class ImageSearchApp extends StatelessWidget {
  const ImageSearchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Search Image',
      home: ListScreen(),
    );
  }
}

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late TextEditingController _textController;
  late ScrollController _scrollController;
  late List data;
  int page = 1;
  bool _isComposing = false;
  bool _downloading = false;

  @override
  void initState() {
    super.initState();
    data = List.empty(growable: true);
    _textController = TextEditingController();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        getMoreData(_textController.value.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                          _handleSubmitted(_textController.text),
                          data.clear()
                        }
                    : null,
              ),
            )
          ],
        )),
        body: Container(
            child: _downloading
                ? Container(
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
                            controller: _scrollController,
                          ),
                  )));
  }

  void _goToDetail(
      String url, BuildContext context, String siteName, String dateTime) {
    setState(() {
      imageUrl = url;
      sitename = siteName;
      datetime = dateTime;
    });
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DetailScreen()));
  }

  void _handleSubmitted(String text) {
    FocusScope.of(context).unfocus();
    setState(() {
      _isComposing = false;
    });
    getJSONData(text);
  }

  // 처음 검색할 때
  Future<String> getJSONData(String text) async {
    setState(() {
      _downloading = true;
    });
    var url =
        'https://dapi.kakao.com/v2/search/image?sort=accuracy&size=30&page=$page&query=$text';
    var response = await http.get(Uri.parse(url),
        headers: {"Authorization": "KakaoAK 74699f722350a89fa49a716a1c8e230b"});
    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = dataConvertedToJSON['documents'];
      data.addAll(result);
    });
    setState(() {
      _downloading = false;
    });
    return response.body;
  }

  // 스크롤해서 데이터 더 불러올 때
  Future<String> getMoreData(String text) async {
    setState(() {
      _downloading = true;
      page++;
    });
    var url =
        'https://dapi.kakao.com/v2/search/image?sort=accuracy&size=30&page=$page&query=$text';
    var response = await http.get(Uri.parse(url),
        headers: {"Authorization": "KakaoAK 74699f722350a89fa49a716a1c8e230b"});
    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = dataConvertedToJSON['documents'];
      data += result;
    });
    setState(() {
      _downloading = false;
    });
    return response.body;
  }
}
