import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quin/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quin/router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    const ProviderScope(
      child: QuinApp(),
    ),
  );
}

class QuinApp extends ConsumerWidget {
  const QuinApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(router);
    return MaterialApp.router(
      routerConfig: goRouter,
    );
  }
}
