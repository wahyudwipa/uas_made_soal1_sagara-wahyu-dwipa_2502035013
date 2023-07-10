import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Step 1: disini saya membuat kelas "changeNotifier" dengan bertujuan mengunci status
class Counter extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // disini akan ada notifikasi bahwa akan ada perubahan status
  }
}

void main() {
  runApp(
    // Step 2: disini kita akan mengunci widget root mennggunakan Changenotifierprovider
    ChangeNotifierProvider(
      create: (_) => Counter(), // saya memberikan intansi pada Changenotifier
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Provider Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Provider Example'),
        ),
        body: Center(
          // Step 3: menggunakan widget untuk mnegetahui akses status
          child: Consumer<Counter>(
            builder: (context, counter, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Count:',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    '${counter.count}', // akses status dari konsumen
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // Step 4: saya menggunakan fungsi untuk mengganti ke status baru
          onPressed: () {
            Provider.of<Counter>(context, listen: false).increment();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
