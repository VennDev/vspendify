import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spendify/controller/locate_controller/locale_controller.dart';
import 'package:spendify/routes/app_pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:spendify/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:app_links/app_links.dart';
import 'dart:async';

late final AppLinks _appLinks;
StreamSubscription<Uri>? _sub;

void main() async {
  await initializeApp();
  runApp(const MyApp());
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.dotenv.load(fileName: '.env');
    final supaUri = dotenv.dotenv.env['SUPABASE_URL'];
    final supaAnon = dotenv.dotenv.env['SUPABASE_ANONKEY'];

    if (supaUri == null || supaAnon == null) {
      throw Exception('Missing SUPABASE_URL or SUPABASE_ANONKEY in .env file');
    }

    await Supabase.initialize(
      url: supaUri,
      anonKey: supaAnon,
    );

    final localeController = Get.put(LocaleController(), permanent: true);
    await localeController.loadLocale();

    await _handleInitialLink();
    listenToDeepLinks();
  } catch (e) {
    print('Lỗi khởi tạo ứng dụng: $e');
    runApp(const ErrorApp());
  }
}

Future<void> _handleInitialLink() async {
  try {
    final appLinks = AppLinks();
    final initialUri = await appLinks.getInitialAppLink();
    if (initialUri != null) {
      print('Initial deep link: $initialUri');
      final queryParams = initialUri.queryParameters;
      if (queryParams.containsKey('code')) {
        // Lưu email từ queryParams nếu có, hoặc lấy từ nơi khác (ví dụ: lưu trữ cục bộ)
        Get.offAllNamed(
          Routes.RESET_PASSWORD,
          arguments: {
            'recovery_token': queryParams['code'],
            'email': queryParams['email'], // Giả sử email có trong queryParams
          },
        );
      } else if (queryParams.containsKey('token')) {
        Get.offAllNamed(
          Routes.RESET_PASSWORD,
          arguments: {
            'recovery_token': queryParams['token'],
            'email': queryParams['email'],
          },
        );
      } else {
        print('No code or token found in initial link');
      }
    }
  } catch (e) {
    print('Lỗi khi xử lý initial link: $e');
  }
}

void listenToDeepLinks() {
  print('Start listening to deep links...');
  _appLinks = AppLinks();
  _sub = _appLinks.uriLinkStream.listen((Uri? uri) {
    if (uri != null) {
      print('Received deep link while running: $uri');
      final queryParams = uri.queryParameters;
      if (queryParams.containsKey('code')) {
        Get.offAllNamed(
          Routes.RESET_PASSWORD,
          arguments: {
            'recovery_token': queryParams['code'],
            'email': queryParams['email'],
          },
        );
      } else if (queryParams.containsKey('token')) {
        Get.offAllNamed(
          Routes.RESET_PASSWORD,
          arguments: {
            'recovery_token': queryParams['token'],
            'email': queryParams['email'],
          },
        );
      } else {
        print('No code or token found in deep link');
      }
    }
  }, onError: (err) {
    print('Error receiving deep link: $err');
  });
}

void restartApp() {
  Get.deleteAll();
  _sub?.cancel();
  initializeApp().then((_) {
    runApp(const MyApp());
  });
}

final supabaseC = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LocaleController>();

    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'VSpendify',
          initialRoute: Routes.SPLASH,
          getPages: AppPages.routes,
          locale: controller.currentLocale.value,
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData(
            fontFamily: 'RobotoSerif',
            textTheme: const TextTheme(
              bodyLarge: TextStyle(fontSize: 18),
              bodyMedium: TextStyle(fontSize: 16),
            ),
          ),
        ));
  }
}

class ErrorApp extends StatelessWidget {
  const ErrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Failed to initialize the app. Please check your configuration.',
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
