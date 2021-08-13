import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget {
  const StreamDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  const StreamDemoHome({Key? key}) : super(key: key);

  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription? _streamDemoSubscription;
  StreamController? _streamDemoController;
  StreamSink? _sinkDemo;
  String _data = '...';

  @override
  void dispose() {
    _streamDemoController?.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // 创建Stream，创建方法很多，现在用Stream.fromFuture
    print('Create a stream');

    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    // _streamDemoController = StreamController<String>();
    _streamDemoController = StreamController.broadcast();
    _sinkDemo = _streamDemoController?.sink;

    // 要使用Stream上的数据，我们需要监听Stream,给Stream添加了一个订阅
    // listen返回StreamSubscription
    print('Start Listening  on a stream');
    _streamDemoSubscription = _streamDemoController?.stream
        .listen(onData, onError: onError, onDone: onDone);

    _streamDemoController?.stream
        .listen(onDataTwo, onError: onError, onDone: onDone);
    // _streamDemoSubscription =_streamDemo.listen(onData, onError: onError, onDone: onDone);
  }

  void onData(data) {
    print('Stream onData: $data');
    // setState(() {
    //   _data = data;
    // });
  }

  void onDataTwo(data) {
    print('Stream onData TWO: $data');
  }

  void onError(error) {
    print('Stream Error: $error');
  }

  void onDone() {
    print('Stream Done!');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    // 正常返回数据
    return 'hello ~';
    // 模拟一个错误发生
    // throw 'Some error happened';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 通过StreamBuilder创建小部件后，就不需要用setState来更新
            StreamBuilder(
              stream: _streamDemoController?.stream,
              initialData: '...',
              builder: (context, snapshot) {
                return Text('${snapshot.data}');
              },
            ),

            Wrap(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: _addDataToStream,
                    child: Text('Add data to Stream')),
                TextButton(
                    onPressed: _pauseStream, child: Text('Pause Stream')),
                TextButton(
                    onPressed: _resumeStream, child: Text('Resume Stream')),
                TextButton(
                    onPressed: _cancelStream, child: Text('Cancel Stream')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _pauseStream() {
    print('pause streamSubscription.');
    _streamDemoSubscription!.pause();
  }

  void _resumeStream() {
    print('resume streamSubscription');
    _streamDemoSubscription!.resume();
  }

  void _cancelStream() {
    print('cancel streamSubscription');
    _streamDemoSubscription!.cancel().then((value) {
      print('stream cancel.then');
    });
  }

  void _addDataToStream() async {
    print('add Data to stream');
    String data = await fetchData();
    // 使用sink添加数据
    _sinkDemo?.add(data);
    // 使用StreamController添加数据
    // _streamDemoController?.add(data);
  }
}
