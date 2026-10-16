import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kashier_flutter_sdk/kashier_flutter_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const KashierExampleApp());
}

const _localePrefKey = 'kashier_example_locale';

class KashierExampleApp extends StatefulWidget {
  const KashierExampleApp({super.key});

  @override
  State<KashierExampleApp> createState() => _KashierExampleAppState();
}

class _KashierExampleAppState extends State<KashierExampleApp> {
  Locale _locale = const Locale('en');

  @override
  void initState() {
    super.initState();
    _loadPersistedLocale();
  }

  Future<void> _loadPersistedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_localePrefKey);
    if (code != null && (code == 'en' || code == 'ar') && mounted) {
      setState(() => _locale = Locale(code));
    }
  }

  Future<void> _onLocaleChanged(Locale locale) async {
    setState(() => _locale = locale);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localePrefKey, locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return KashierPaymentProvider(
      child: MaterialApp(
        title: 'Kashier SDK Example',
        locale: _locale,
        supportedLocales: const [Locale('en'), Locale('ar')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(
          colorSchemeSeed: const Color(0xFF1A73E8),
          useMaterial3: true,
        ),
        home: PaymentPage(locale: _locale, onLocaleChanged: _onLocaleChanged),
      ),
    );
  }
}

class PaymentPage extends StatefulWidget {
  final Locale locale;
  final ValueChanged<Locale> onLocaleChanged;

  const PaymentPage({
    super.key,
    required this.locale,
    required this.onLocaleChanged,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _sessionIdController = TextEditingController(text: '');
  KashierMode _mode = KashierMode.test;
  bool _loading = false;
  String? _statusMessage;
  bool? _statusSuccess;

  @override
  void initState() {
    super.initState();
    _initializeSDK();
  }

  @override
  void didUpdateWidget(covariant PaymentPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.locale != widget.locale) {
      _initializeSDK();
    }
  }

  void _initializeSDK() {
    KashierSDK.initialize(
      mode: _mode,
      language: widget.locale.languageCode == 'ar'
          ? KashierLanguage.ar
          : KashierLanguage.en,
      // Example app ships under Kashier's own Apple account, so it uses
      // Kashier's Merchant ID (matches example/ios/Runner/Runner.entitlements).
      // Real merchants pass their own Apple Merchant ID here.
      appleMerchantId: 'merchant.com.kashier.payments',
    );
  }

  void _onModeChanged(KashierMode mode) {
    setState(() {
      _mode = mode;
      _statusMessage = null;
      _statusSuccess = null;
    });
    _initializeSDK();
  }

  void _startPayment() {
    final sessionId = _sessionIdController.text.trim();
    if (sessionId.isEmpty) {
      setState(() {
        _statusMessage = 'Please enter a session ID.';
        _statusSuccess = false;
      });
      return;
    }

    setState(() {
      _loading = true;
      _statusMessage = null;
      _statusSuccess = null;
    });

    KashierSDK.startPayment(
      sessionId: sessionId,
      onSuccess: (KashierPaymentResult result) {
        if (!mounted) return;
        setState(() {
          _loading = false;
          _statusSuccess = true;
          _statusMessage =
              'Payment succeeded!\n'
              'Session: ${result.sessionId}\n'
              'Status: ${result.status}\n'
              'Order: ${result.orderId ?? "N/A"}\n'
              'Transaction: ${result.transactionId ?? "N/A"}';
        });
      },
      onPending: (KashierPaymentPending pending) {
        if (!mounted) return;
        setState(() {
          _loading = false;
          _statusSuccess = null;
          _statusMessage =
              'Payment pending...\n'
              'Order: ${pending.orderId}\n'
              'Transaction: ${pending.transactionId}\n'
              'Message: ${pending.message}';
        });
      },
      onFailure: (KashierPaymentError error) {
        if (!mounted) return;
        setState(() {
          _loading = false;
          _statusSuccess = false;
          _statusMessage =
              'Payment failed.\n'
              'Code: ${error.code.name}\n'
              'Message: ${error.message}';
        });
      },
    );
  }

  @override
  void dispose() {
    _sessionIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kashier SDK Example')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Mode toggle
            SegmentedButton<KashierMode>(
              segments: const [
                ButtonSegment(value: KashierMode.test, label: Text('Test')),
                ButtonSegment(value: KashierMode.live, label: Text('Live')),
              ],
              selected: {_mode},
              onSelectionChanged: (selected) => _onModeChanged(selected.first),
            ),
            const SizedBox(height: 12),

            // Language toggle
            SegmentedButton<Locale>(
              segments: const [
                ButtonSegment(value: Locale('en'), label: Text('English')),
                ButtonSegment(value: Locale('ar'), label: Text('العربية')),
              ],
              selected: {widget.locale},
              onSelectionChanged: (selected) =>
                  widget.onLocaleChanged(selected.first),
            ),
            const SizedBox(height: 24),

            // Session ID input
            TextField(
              controller: _sessionIdController,
              decoration: const InputDecoration(
                labelText: 'Session ID',
                hintText: 'Enter your payment session ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Pay button — SDK handles showing Apple Pay / method selection.
            ElevatedButton(
              onPressed: _loading ? null : _startPayment,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
              child: _loading
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2.5),
                    )
                  : const Text('Proceed Payment'),
            ),

            const SizedBox(height: 24),

            // Status message
            if (_statusMessage != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _statusSuccess == true
                      ? Colors.green.shade50
                      : _statusSuccess == false
                      ? Colors.red.shade50
                      : Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _statusMessage!,
                  style: TextStyle(
                    color: _statusSuccess == true
                        ? Colors.green.shade900
                        : _statusSuccess == false
                        ? Colors.red.shade900
                        : Colors.orange.shade900,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
