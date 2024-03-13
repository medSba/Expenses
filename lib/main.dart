import 'package:expenses/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var myColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(115, 144, 114,0));
var myDarkColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(115, 144, 114,0));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: ThemeData().copyWith(
        useMaterial3: true,
      colorScheme: myColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: myColorScheme.onPrimaryContainer,
          foregroundColor: myColorScheme.primaryContainer
      ),
      cardTheme: const CardTheme().copyWith(
        color: myColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style:ElevatedButton.styleFrom(
          backgroundColor:  myColorScheme.primaryContainer,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.normal,
          color: myColorScheme.onSecondaryContainer,
          fontSize: 14
        )
      )),
        darkTheme: ThemeData.dark().copyWith(
            useMaterial3: true,
            colorScheme: myDarkColorScheme,
            appBarTheme: const AppBarTheme().copyWith(
                backgroundColor: myDarkColorScheme.onPrimaryContainer,
                foregroundColor: myDarkColorScheme.primaryContainer
            ),
            cardTheme: const CardTheme().copyWith(
              color: myDarkColorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            ),
            bottomSheetTheme: const BottomSheetThemeData().copyWith(
              backgroundColor: myDarkColorScheme.onPrimaryContainer,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style:ElevatedButton.styleFrom(
                backgroundColor: myDarkColorScheme.onPrimaryContainer,
                foregroundColor: myDarkColorScheme.primaryContainer,
              ),
            ),
            textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: myDarkColorScheme.onSecondaryContainer,
                    fontSize: 17
                )
            )),
      home: const Expenses(),
    );
  }
}

