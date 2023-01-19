import 'package:km_test/src/providers/user/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MyProvider {
  MyProvider._();

  static final data = <SingleChildWidget>[
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
    ),
  ];
}
