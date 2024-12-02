class SoupMarketConfig {
  final String apiKey;
  final String apiSecret;
  final String baseUrl;
  final Environment environment;
  final Duration timeout;
  final Map<String, dynamic>? additionalHeaders;

  SoupMarketConfig({
    required this.apiKey,
    required this.apiSecret,
    this.baseUrl = 'https://demo.soupmarkets.com',
    this.environment = Environment.test,
    this.timeout = const Duration(seconds: 30),
    this.additionalHeaders,
  });
}

enum Environment {
  test,
  sandbox,
  production;

  // String get baseUrl {
  //   switch (this) {
  //     case Environment.test:
  //       return '';
  //     case Environment.sandbox:
  //       return 'https://demo.soupmarkets.com';
  //     case Environment.production:
  //       return '';
  //   }
  // }
}