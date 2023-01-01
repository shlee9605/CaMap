import 'package:flutter/material.dart';
import 'package:firebase_analytics/observer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.observer});

  final FirebaseAnalyticsObserver observer;

  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage>
    with SingleTickerProviderStateMixin, RouteAware {
  TabController? _controller;
  int selectedIndex = 0;

  final List<Tab> tabs = <Tab>[
    const Tab(
      text: '1번',
      icon: Icon(Icons.looks_one),
    ),
    const Tab(
      text: '2번',
      icon: Icon(Icons.looks_two),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      vsync: this,
      length: tabs.length,
      initialIndex: selectedIndex,
    );
    _controller!.addListener(() {
      setState(() {
        if (selectedIndex != _controller!.index) {
          selectedIndex = _controller!.index;
          _sendCurrentTab();
        }
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.observer.subscribe(this, ModalRoute.of(context) as dynamic);
  }

  @override
  void dispose() {
    widget.observer.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _controller,
          tabs: tabs,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: tabs.map((Tab tab) {
          return TextButton(
            onPressed: () => throw Exception(),
            child: Text(tab.text!),
          );
        }).toList(),
      ),
    );
  }

  void _sendCurrentTab() {
    widget.observer.analytics.setCurrentScreen(
      screenName: 'tab/$selectedIndex',
    );
  }
}
