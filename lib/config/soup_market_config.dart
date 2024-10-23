class SoupMarketConfig {
  final String apiKey;
  final String baseUrl;
  final Environment environment;
  final Duration timeout;
  final Map<String, dynamic>? additionalHeaders;

  SoupMarketConfig({
    required this.apiKey,
    this.baseUrl = 'https://api.soupmarket.com',
    this.environment = Environment.sandbox,
    this.timeout = const Duration(seconds: 30),
    this.additionalHeaders,
  });
}

enum Environment {
  sandbox,
  production;

  String get baseUrl {
    switch (this) {
      case Environment.sandbox:
        return 'https://sandbox-api.soupmarket.com';
      case Environment.production:
        return 'https://api.soupmarket.com';
    }
  }
}