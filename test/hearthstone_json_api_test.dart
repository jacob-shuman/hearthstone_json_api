import "dart:math";

import 'package:test/test.dart';
import 'package:hearthstone_json_api/hearthstone_json_api.dart';

// TODO: implement formatting test
void main() {
  group('A group of tests', () {
    HearthstoneJsonApi api;

    setUp(() {
      api = HearthstoneJsonApi();
    });

    test('getCards returns non-null value', () async {
      List<HearthstoneJsonApiCard> result =
          await api.getCards(locale: HearthstoneJsonApiLocale.ENUS);

      expect(result, isNotNull);
    });

    test('getCollectibleCards returns non-null value', () async {
      List<HearthstoneJsonApiCard> result =
          await api.getCollectibleCards(locale: HearthstoneJsonApiLocale.ENUS);

      expect(result, isNotNull);
    });
  });
}
