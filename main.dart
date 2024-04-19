
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Product_run/controller/Product_provider.dart';
import 'app.dart';

void main() {
  runApp(MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context) => ProductNotifier()),
      ],
      child: const App()));
}



