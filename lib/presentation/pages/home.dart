


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/config/constant.dart';




class MyHomePage extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',

            ),
            Text(
              '0',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text('hello'.tr,style: TextStyle(fontSize: 15),),
            SizedBox(height: 10,),
            Text('message'.tr,style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Text('subscribe'.tr,style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
         buildLanguageDialog(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  buildLanguageDialog(BuildContext context) {
    showDialog(context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('Choose Your Language'),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(Constants.languages[index]),
                        onTap: () {
                          print(Constants.locale[index]['name']);
                          Get.back();
                          Get.updateLocale(Constants.locale[index]['locale']);
                        },),
                    );
                  }, separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.blue,
                );
              }, itemCount: Constants.languages.length
              ),
            ),
          );
        }
    );
  }





}

