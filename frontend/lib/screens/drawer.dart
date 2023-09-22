import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    super.key,
    required this.changeTheme,
    required this.getTheme,
  });
  final VoidCallback changeTheme;
  final Function getTheme;

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  void initState() {
    super.initState();
  }

  void toggleSwitch() {
    setState(() {
      widget.changeTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ElevatedButton(
            child: widget.getTheme()
                ? const Text("Zum dunklen Modus wechseln")
                : const Text("Zum hellen Modus wechseln"),
            onPressed: () {
              toggleSwitch();
            },
          ),
        ],
      ),
    );
  }
}
