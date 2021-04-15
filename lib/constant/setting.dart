import 'package:flutter/material.dart';
import 'texts.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Texts(
            weights: null,
            title: 'Settings',
            colors: Colors.white,
            size: 18,
            family: null),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    child: Texts(
                        weights: FontWeight.bold,
                        title: 'GENERAL SETTINGS',
                        colors: Colors.black,
                        size: 18,
                        family: null),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                child: Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      ListTile(
                        leading: IconButton(
                          icon: Icon(
                            Icons.lock_outline,
                            color: Colors.purple[600],
                          ),
                          onPressed: null,
                        ),
                        title: Texts(
                            weights: FontWeight.w400,
                            title: 'Change Password',
                            colors: Colors.black,
                            size: 16,
                            family: null),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.navigate_next,
                            color: Colors.grey,
                            size: 32,
                          ),
                          onPressed: null,
                        ),
                      ),
                      Divider(
                        indent: 15,
                        endIndent: 15,
                        thickness: 1,
                      ),
                      ListTile(
                        leading: IconButton(
                          icon: Icon(
                            Icons.language,
                            color: Colors.purple[600],
                          ),
                          onPressed: null,
                        ),
                        title: Texts(
                            weights: FontWeight.w400,
                            title: 'Change Language',
                            colors: Colors.black,
                            size: 16,
                            family: null),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.navigate_next,
                            color: Colors.grey,
                            size: 32,
                          ),
                          onPressed: null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
