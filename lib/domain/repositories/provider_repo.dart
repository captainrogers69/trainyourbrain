import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:trainyourbrain/presentation/providers/auth_provider.dart';
import 'package:trainyourbrain/presentation/providers/bottom_provider.dart';
import 'package:trainyourbrain/presentation/providers/home_provider.dart';

class RepoProvider {
  List<SingleChildWidget> generalProviders = [
    ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
    ChangeNotifierProvider<BottomProvider>(create: (_) => BottomProvider()),
    ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
  ];
}
