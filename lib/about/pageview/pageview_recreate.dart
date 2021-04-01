import 'package:flutter/material.dart';

class MyPageView extends StatelessWidget {
  const MyPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: const <Widget>[
        _ContentView(
          title: 'First Page',
        ),
        _ContentView(
          title: 'Second Page',
          keepAlive: true,
        ),
        _ContentView(
          title: 'Third Page',
        ),
      ],
    );
  }
}

class _ContentView extends StatefulWidget {
  final String title;
  final bool keepAlive;

  const _ContentView({Key? key, this.title = '', this.keepAlive = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return keepAlive ? _ContentViewState2() : _ContentViewState1();
  }
}

class _ContentViewState1 extends State<_ContentView> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Num:$_count'),
        ElevatedButton(
          child: Text('increase'),
          onPressed: () {
            _count++;
            setState(() {});
          },
        )
      ],
    );
  }
}

class _ContentViewState2 extends State<_ContentView>
    with AutomaticKeepAliveClientMixin {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Num:$_count'),
        ElevatedButton(
          child: Text('increase'),
          onPressed: () {
            _count++;
            setState(() {});
          },
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
