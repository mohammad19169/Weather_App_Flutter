import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(child: Text('Bottom Sheet')),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    isDismissible: true,
                    enableDrag: false,
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text('HTML'),
                            subtitle: Text('HyperText Markup Language'),
                          ),
                          ListTile(
                            title: Text('CSS'),
                            subtitle: Text('Cascading Style Sheet'),
                          ),
                          ListTile(
                            title: Text('HTTP'),
                            subtitle: Text('HyperText Transfer Protocol'),
                          ),
                          ListTile(
                            title: Text('SEO'),
                            subtitle: Text('Search Engine Optimization '),
                          ),
                        ],
                      );
                    });
              },
              child: Text('show Bottom Sheet'))),
    );
  }
}
