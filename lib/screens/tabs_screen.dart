import 'package:fitness_app/screens/tabs/sessions_tab.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  static const String routeName = '/home';

  const TabsScreen();

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  bool _isLoading = false;
  late Widget _selectedPage = items[0]['tabWidget'];

  final List<Map<String, dynamic>> items = [
    {
      'name': 'Sessions',
      'navBarItem': BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Sessions'),
      'tabWidget': SessionsTab(),
    },
    {
      'name': 'Settings',
      'navBarItem': BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      'tabWidget': Center(child: Text('What brought you here?')),
    }
  ];

  List<BottomNavigationBarItem> getNavBarItems() {
    List<BottomNavigationBarItem> d = [];
    items.forEach((item) => d.add(item['navBarItem']));
    return d;
  }

  @override
  void initState() {
    super.initState();
    _selectedPage = items[0]['tabWidget'];
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const Center(child: CircularProgressIndicator());
    return Scaffold(
      body: _selectedPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: getNavBarItems(),
        onTap: (index) {
          setState(() {
            _selectedPage = items[index]['tabWidget'];
          });
        },
      ),
    );
  }
}
