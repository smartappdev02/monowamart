import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:monowamart/constants/theme_data.dart';
import 'package:monowamart/models/theme_preferences.dart';
import 'package:monowamart/providers/theme_change_provider.dart';
import 'package:monowamart/screens/inner_screens/forgot_password.dart';
import 'package:monowamart/screens/main_screen.dart';
import 'package:monowamart/providers/auth_provider.dart';
import 'package:monowamart/providers/user_data_provider.dart';
import 'package:monowamart/screens/bottom_bar.dart';
import 'package:monowamart/constants/route_name.dart';
import 'package:monowamart/screens/inner_screens/category_screen.dart';
import 'package:monowamart/providers/cart_provider.dart';
import 'package:monowamart/providers/product_provider.dart';
import 'package:monowamart/providers/wishlist_provider.dart';
import 'package:monowamart/screens/inner_screens/cart.dart';
import 'package:monowamart/screens/inner_screens/product_details/product_detail.dart';
import 'package:monowamart/screens/feeds.dart';
import 'package:monowamart/screens/log_in.dart';
import 'package:monowamart/screens/sign_up.dart';
import 'package:monowamart/screens/wishlist.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isDarkTheme = await ThemePreferences().getTheme();
  runApp(MyApp(
    isDarkTheme: isDarkTheme,
  ));
}

class MyApp extends StatelessWidget {
  final bool isDarkTheme;

  const MyApp({Key? key, required this.isDarkTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return ChangeNotifierProvider(
          create: (BuildContext context) {
            return ThemeChangeProvider(isDarkTheme);
          },
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => AuthProvider()),
              ChangeNotifierProvider(create: (_) => UserDataProvider()),
              ChangeNotifierProvider(create: (_) => ProductProvider()),
              ChangeNotifierProvider(create: (_) => CartProvider()),
              ChangeNotifierProvider(create: (_) => WishlistProvider()),
            ],
            child: Consumer<ThemeChangeProvider>(
              builder: (_, themeChangeProvider, __) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Store App',
                  theme: Styles.getThemeData(themeChangeProvider.isDarkTheme),
                  routes: {
                    RouteName.mainScreen: (context) => MainScreen(),
                    RouteName.bottomBarScreen: (context) => BottomBarScreen(),
                    RouteName.logInScreen: (contex) => const LogInScreen(),
                    RouteName.signUpScreen: (context) => const SignUpScreen(),
                    RouteName.forgotPasswordScreen: (context) =>
                        const ForgotPasswordScreen(),
                    RouteName.productDetailScreen: (context) =>
                        const ProductDetailScreen(),
                    RouteName.feedsScreen: (context) => FeedsScreen(),
                    RouteName.cartScreen: (context) => CartScreen(),
                    RouteName.wishlistScreen: (context) =>
                        const WishlistScreen(),
                    RouteName.categoryScreen: (context) => CategoryScreen(),
                  },
                );
              },
            ),
          ));
    });
  }
}

/// return ChangeNotifierProvider(
//         create: (BuildContext context) {
//           return ThemeChangeProvider(isDarkTheme);
//         },
//         child: MultiProvider(
//           providers: [
//             ChangeNotifierProvider(create: (_) => AuthProvider()),
//             ChangeNotifierProvider(create: (_) => UserDataProvider()),
//             ChangeNotifierProvider(create: (_) => ProductProvider()),
//             ChangeNotifierProvider(create: (_) => CartProvider()),
//             ChangeNotifierProvider(create: (_) => WishlistProvider()),
//           ],
//           child: Consumer<ThemeChangeProvider>(
//             builder: (_, themeChangeProvider, __) {
//               return MaterialApp(
//                 debugShowCheckedModeBanner: false,
//                 title: 'Store App',
//                 theme: Styles.getThemeData(themeChangeProvider.isDarkTheme),
//                 routes: {
//                   RouteName.mainScreen: (context) => MainScreen(),
//                   RouteName.bottomBarScreen: (context) => BottomBarScreen(),
//                   RouteName.logInScreen: (contex) => const LogInScreen(),
//                   RouteName.signUpScreen: (context) => const SignUpScreen(),
//                   RouteName.forgotPasswordScreen: (context) =>
//                       const ForgotPasswordScreen(),
//                   RouteName.productDetailScreen: (context) =>
//                       const ProductDetailScreen(),
//                   RouteName.feedsScreen: (context) => FeedsScreen(),
//                   RouteName.cartScreen: (context) => CartScreen(),
//                   RouteName.wishlistScreen: (context) => const WishlistScreen(),
//                   RouteName.categoryScreen: (context) => CategoryScreen(),
//                 },
//               );
//             },
//           ),
//         ));

// class MyApp extends StatelessWidget {
//   final bool isDarkTheme;
//
//   const MyApp({Key? key, required this.isDarkTheme}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => ThemeChangeProvider(isDarkTheme),
//       child: FutureBuilder(
//           future: Firebase.initializeApp(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return MultiProvider(
//                 providers: [
//                   ChangeNotifierProvider(create: (_) => AuthProvider()),
//                   ChangeNotifierProvider(create: (_) => new UserDataProvider()),
//                   ChangeNotifierProvider(create: (_) => new ProductProvider()),
//                   ChangeNotifierProvider(create: (_) => new CartProvider()),
//                   ChangeNotifierProvider(create: (_) => new WishlistProvider()),
//                 ],
//                 child: Consumer<ThemeChangeProvider>(
//                   builder: (_, themeChangeProvider, __) {
//                     return MaterialApp(
//                       debugShowCheckedModeBanner: false,
//                       title: 'Store App',
//                       theme:
//                           Styles.getThemeData(themeChangeProvider.isDarkTheme),
//                       // initialRoute: RouteName.forgotPasswordScreen,
//                       routes: {
//                         RouteName.mainScreen: (context) => MainScreen(),
//                         RouteName.bottomBarScreen: (context) =>
//                             BottomBarScreen(),
//                         RouteName.logInScreen: (contex) => const LogInScreen(),
//                         RouteName.signUpScreen: (context) => const SignUpScreen(),
//                         RouteName.forgotPasswordScreen: (context) =>
//                             const ForgotPasswordScreen(),
//                         RouteName.productDetailScreen: (context) =>
//                             const ProductDetailScreen(),
//                         RouteName.feedsScreen: (context) => FeedsScreen(),
//                         RouteName.cartScreen: (context) => CartScreen(),
//                         RouteName.wishlistScreen: (context) => const WishlistScreen(),
//                         RouteName.categoryScreen: (context) => CategoryScreen(),
//
//                       },
//                     );
//                   },
//                 ),
//               );
//             } else if (snapshot.hasError) {
//               return Consumer<ThemeChangeProvider>(
//                 builder: (_, themeChangeProvider, __) => MaterialApp(
//                   theme: Styles.getThemeData(themeChangeProvider.isDarkTheme),
//                   home: const Scaffold(
//                     body: Center(child: Text('Something went wrong :(')),
//                   ),
//                 ),
//               );
//             }
//             return Consumer<ThemeChangeProvider>(
//               builder: (_, themeChangeProvider, __) => MaterialApp(
//                 theme: Styles.getThemeData(themeChangeProvider.isDarkTheme),
//                 home: Scaffold(
//                   body: Center(
//                       child: CircularProgressIndicator(
//                     color: Theme.of(context).primaryColor,
//                   )),
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }
