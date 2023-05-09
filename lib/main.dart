import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainyourbrain/domain/repositories/provider_repo.dart';
import 'app/my_app.dart';

Future<void> main() async {
  runApp(
    MultiProvider(
      providers: RepoProvider().generalProviders,
      child: const MyApp(),
    ),
  );
}
