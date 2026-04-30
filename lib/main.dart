import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/firebase_init.dart';
import 'providers/auth_provider.dart';
import 'providers/producto_provider.dart';
import 'screens/navigation/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseInit.initialize();
  runApp(const GameShopApp());
}

class GameShopApp extends StatelessWidget {
  const GameShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductoProvider()),
      ],
      child: MaterialApp(
        title: 'GameShop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF6C63FF),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
