import 'package:flutter_test/flutter_test.dart';
import 'package:movies_api/core/utils/extensions/url_helper.dart';

void main() {
  group('Test UrlHelper extension', () {
    test('verify if return type is a complete Url', () {
      String _baseUrl = 'www.test.com/';
      String _size = 'w250';
      String _path = '/image_test.jpg';
      final url = _baseUrl.concatUrl(_size, _path);
      String expectedUrl = 'www.test.com/w250/image_test.jpg';

      expect(url, expectedUrl);
    });
    
  });
}
