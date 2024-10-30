# SoupMarket Flutter SDK

The official Flutter SDK for integrating SoupMarket's API into your applications. This SDK provides a simple and efficient way to implement authentication, KYC, order management, and other SoupMarket features in your Flutter app.

## Features

- 🔐 Authentication (Sign up, Login, Password Reset)
- 📝 KYC Management
- 🛍️ Order Processing
- 💼 User Management
- ⚡ GetX State Management Integration
- 🔄 Automatic Token Management
- 🌐 Environment Switching (Sandbox/Production)

## Requirements

- Flutter SDK: >= 3.0.0
- Dart SDK: >= 3.0.0

## Installation

Add the SoupMarket SDK to your `pubspec.yaml`:

```yaml
dependencies:
  soupmarket_sdk:
    git:
      url: https://github.com/soupmarket/soupmarket_sdk.git
      ref: main  # or specific version tag
```

Run:
```bash
flutter pub get
```

## Quick Start

### 1. Initialize the SDK

In your `main.dart` file:

```dart
import 'package:soupmarket_sdk/soupmarket_sdk.dart';

void main() {
  SoupMarketSDK.instance.initialize(
    SoupMarketConfig(
      apiKey: 'your_api_key',
      apiSecret: 'your_api_secret',
      environment: Environment.sandbox,
      baseUrl: "https://demo.soupmarkets.com",
      timeout: Duration(seconds: 60),
      additionalHeaders: {
        'App-Version': '1.0.0',
      },
    ),
  );
  
  runApp(MyApp());
}
```

### 2. Basic Usage

#### Authentication

```dart
// Sign up a new user
try {
  final result = await SoupMarketSDK.instance.auth.signUp(
    email: 'user@example.com',
    password: 'securePassword123',
    fullName: 'John Doe',
  );
  print('User created: ${result.userId}');
} catch (e) {
  print('Error during signup: $e');
}

// Login
try {
  final result = await SoupMarketSDK.instance.auth.login(
    email: 'user@example.com',
    password: 'securePassword123',
  );
  print('Logged in: ${result.token}');
} catch (e) {
  print('Error during login: $e');
}
```

#### KYC Submission

```dart
try {
  final result = await SoupMarketSDK.instance.clientRegister(
    map: {
      'idType': 'passport',
      'idNumber': 'ABC123456',
      'dateOfBirth': '1990-01-01',
      // Add other KYC fields as required
    },
  );
  print('KYC Status: ${result.status}');
} catch (e) {
  print('Error submitting KYC: $e');
}
```

### Authentication
- `signUp()`
- `login()`
- `resetPassword()`
- `verifyEmail()`
- `refreshToken()`

### KYC
- `submitKYC()`
- `updateKYC()`
- `getKYCStatus()`
- `uploadDocument()`

### Orders
- `createOrder()`
- `getOrderStatus()`
- `cancelOrder()`
- `getOrderHistory()`

## Common Issues and Solutions

### Token Expiration
The SDK automatically handles token refresh. However, you can manually refresh when needed:

```dart
await SDKServiceRequest.instance.auth.refreshToken();
```

### Network Issues
The SDK includes automatic retry logic for network failures. You can configure retry settings:

```dart
SDKServiceRequest.initialize(
  SoupMarketConfig(
    apiKey: 'your_api_key',
    apiSecret: 'your_api_secret',
    networkRetries: 3,
    retryDelay: Duration(seconds: 2),
  ),
);
```

## Support

- Documentation: [https://docs.soupmarket.app](https://docs.soupmarket.app)
- Issues: [GitHub Issues](https://github.com/soupmarket/soupmarket_sdk/issues)
- Email: support@soupmarket.app

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.