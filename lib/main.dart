import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/routes.dart';
import 'package:flutter/material.dart';
import 'constants/global_variable.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        // is not restarted.
        primarySwatch: Colors.orange,
        // colorScheme: const ColorScheme.light(),
        primaryColor: GlobalVariables.secondaryColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black
          )
        )
      ),
      onGenerateRoute: (settings)=> generateRoute(settings),
      home: Scaffold(
        appBar: AppBar(title: const Text('Amazone clone'),),
        body: Column(
          children: [
             const Center(
              child: Text('Hello World'),
            ),
            Builder(
              builder: (context) {
                return ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, AuthScreen.routeName);
                }, child: const Text('Click'));
              }
            )
          ],
          
        ),
      ),
    );
  }
}

