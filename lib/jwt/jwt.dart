import 'dart:convert';

class JWT {
  /// Decode a string JWT token into a `Map<String, dynamic>`
  /// containing the decoded JSON payload.
  static Map<String, dynamic> decode(String token) {
    final splitToken = token.split(".");
    if (splitToken.length != 3) {
      throw const FormatException('Invalid token');
    }
    try {
      final payloadBase64 = splitToken[1]; // Payload is always the index 1
      // Base64 should be multiple of 4. Normalize the payload before decode it
      final normalizedPayload = base64.normalize(payloadBase64);
      // Decode payload, the result is a String
      final payloadString = utf8.decode(base64.decode(normalizedPayload));
      // Parse the String to a Map<String, dynamic>
      final decodedPayload = jsonDecode(payloadString);

      // Return the decoded payload
      return decodedPayload;
    } catch (error) {
      throw const FormatException('Invalid payload');
    }
  }

  /// Decode a string JWT token into a `Map<String, dynamic>`
  /// containing the decoded JSON payload.
  static Map<String, dynamic>? tryDecode(String token) {
    try {
      return decode(token);
    } catch (error) {
      return null;
    }
  }

  /// Returns false if the token is valid, true if it is expired.
  static bool isExpired(String token) {
    final expirationDate = getExpirationDate(token);
    if (expirationDate == null) {
      return false;
    }

    return DateTime.now().isAfter(expirationDate);
  }

  static DateTime? _getDate({required String token, required String claim}) {
    final decodedToken = decode(token);
    final expiration = decodedToken[claim] as int?;
    if (expiration == null) {
      return null;
    }
    return DateTime.fromMillisecondsSinceEpoch(expiration * 1000);
  }

  /// Returns token expiration date
  static DateTime? getExpirationDate(String token) {
    return _getDate(token: token, claim: 'exp');
  }

  /// Returns token issuing date (iat)
  static Duration? getTokenTime(String token) {
    final issuedAtDate = _getDate(token: token, claim: 'iat');
    if (issuedAtDate == null) {
      return null;
    }
    return DateTime.now().difference(issuedAtDate);
  }

  /// Returns remaining time until expiry date.
  static Duration? getRemainingTime(String token) {
    final expirationDate = getExpirationDate(token);
    if (expirationDate == null) {
      return null;
    }

    return expirationDate.difference(DateTime.now());
  }
}
