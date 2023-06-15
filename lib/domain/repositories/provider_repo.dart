import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:trainyourbrain/presentation/providers/auth_provider.dart';
import 'package:trainyourbrain/presentation/providers/bottom_provider.dart';
import 'package:trainyourbrain/presentation/providers/feedback_provider.dart';
import 'package:trainyourbrain/presentation/providers/home_provider.dart';

import '../../presentation/providers/user_provider.dart';

class RepoProvider {
  List<SingleChildWidget> generalProviders = [
    ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
    ChangeNotifierProvider<BottomProvider>(create: (_) => BottomProvider()),
    ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
    ChangeNotifierProvider<FeedbackProvider>(create: (_) => FeedbackProvider()),
    ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
  ];
}
