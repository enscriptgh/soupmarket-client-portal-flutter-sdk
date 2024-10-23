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
      environment: Environment.sandbox,
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
  final result = await SDKServiceRequest.instance.auth.signUp(
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
  final result = await SDKServiceRequest.instance.auth.login(
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
  final result = await SDKServiceRequest.instance.kyc.submit(
    userId: 'user_id',
    kycData: {
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

#### Order Management

```dart
// Create a new order
try {
  final order = await SDKServiceRequest.instance.orders.create(
    userId: 'user_id',
    orderDetails: {
      'amount': 100.00,
      'currency': 'USD',
      'items': [
        {
          'id': 'item_1',
          'quantity': 2,
        }
      ],
    },
  );
  print('Order created: ${order.orderId}');
} catch (e) {
  print('Error creating order: $e');
}

// Check order status
try {
  final status = await SDKServiceRequest.instance.orders.getStatus(
    orderId: 'order_123',
  );
  print('Order status: ${status.currentStatus}');
} catch (e) {
  print('Error checking order status: $e');
}
```

### 3. Using with GetX (Optional)

If you're using GetX for state management:

```dart
// Initialize controller
final controller = Get.put(SoupMarketController());

// In your widget
Obx(() {
  if (controller.isLoading) {
    return CircularProgressIndicator();
  }
  
  if (controller.user != null) {
    return Text('Welcome ${controller.user!.fullName}');
  }
  
  return LoginForm();
});

// Perform actions
await controller.login('user@example.com', 'password123');
```

## Advanced Usage

### Error Handling

The SDK provides specific error types for different scenarios:

```dart
try {
  await SDKServiceRequest.instance.auth.login(
    email: 'user@example.com',
    password: 'wrong_password',
  );
} catch (e) {
  if (e is SoupMarketAuthException) {
    print('Authentication error: ${e.message}');
  } else if (e is SoupMarketNetworkException) {
    print('Network error: ${e.message}');
  } else {
    print('Unknown error: $e');
  }
}
```

### Environment Configuration

```dart
// For development/testing
SDKServiceRequest.initialize(
  SoupMarketConfig(
    apiKey: 'sandbox_key',
    environment: Environment.sandbox,
    logLevel: LogLevel.debug,
  ),
);

// For production
SDKServiceRequest.initialize(
  SoupMarketConfig(
    apiKey: 'production_key',
    environment: Environment.production,
    logLevel: LogLevel.error,
  ),
);
```

## Available Methods

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