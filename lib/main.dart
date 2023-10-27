import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reports_drivers/data/repository/user_repository_impl.dart';
import 'package:reports_drivers/presentatoin/bloc/bloc/authorization_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepositoryImplementation(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthorizationBloc>(create: (context) => AuthorizationBloc()),
          //TODO: add here bloc for reports in future
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Container()
        ),
      ),
    );
  }
}

