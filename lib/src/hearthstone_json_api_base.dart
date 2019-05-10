import "dart:convert";
import "package:meta/meta.dart";
import 'package:http/http.dart' as http;
import "./hearthstone_json_api_locale.dart";
import "./hearthstone_json_api_card.dart";
import "./hearthstone_json_api_image_extension.dart";
import "./hearthstone_json_api_image_size.dart";

class HearthstoneJsonApi {
  String _version = "v1";
  String _domain = "hearthstonejson.com";
  String _apiSubdomain = "api";
  String _artSubdomain = "art";

  Future<dynamic> _request({
    @required String path,
  }) async {
    http.Response result =
        await http.get(_buildApiRoute(path: path).toString());

    return json.decode(result.body) is List<dynamic>
        ? json.decode(result.body)
        : [];
  }

  Uri _buildApiRoute({
    @required String path,
  }) =>
      Uri.https(
        "${this._apiSubdomain}.${this._domain}",
        "/$_version/latest/$path",
      );

  Uri _buildArtRoute({
    @required String size,
    @required String id,
    @required String extension,
  }) =>
      Uri.https(
        "${this._artSubdomain}.${this._domain}",
        "/${this._version}/$size/$id.$extension",
      );

  Uri _buildTileRoute({
    @required String id,
    @required String extension,
  }) =>
      Uri.https(
        "${this._artSubdomain}.${this._domain}",
        "/${this._version}/tiles/$id.$extension",
      );

  Uri _buildRenderRoute({
    @required String locale,
    @required String size,
    @required String id,
    @required String extension,
  }) =>
      Uri.https(
        "${this._artSubdomain}.${this._domain}",
        "/${this._version}/render/latest/$locale/$size/$id.$extension",
      );

  List<HearthstoneJsonApiCard> _parseCardJsonList({
    @required List<dynamic> json,
    HearthstoneJsonApiLocale locale = HearthstoneJsonApiLocale.ALL,
  }) =>
      json
          .map(
            (dynamic card) => HearthstoneJsonApiCard(
                  id: card["id"],
                  dbfId: card["dbfId"],
                  name: card["name"],
                  text: card["text"],
                  flavor: card["flavor"],
                  artist: card["artist"],
                  attack: card["attack"],
                  cardClass: card["cardClass"],
                  collectible: card["collectible"],
                  cost: card["cost"],
                  elite: card["elite"],
                  faction: card["faction"],
                  health: card["health"],
                  mechanics: card["mechanics"] is List<String>
                      ? card["mechanics"] as List<String>
                      : [],
                  rarity: card["rarity"],
                  set: card["set"],
                  type: card["type"],
                ),
          )
          .toList();

  Future<List<HearthstoneJsonApiCard>> getCards({
    HearthstoneJsonApiLocale locale = HearthstoneJsonApiLocale.ALL,
  }) async =>
      _parseCardJsonList(
        json: await _request(path: "${getLocaleText(locale)}/cards.json"),
        locale: locale,
      );

  Future<List<HearthstoneJsonApiCard>> getCollectibleCards({
    HearthstoneJsonApiLocale locale = HearthstoneJsonApiLocale.ALL,
  }) async =>
      _parseCardJsonList(
        json: await _request(
            path: "${getLocaleText(locale)}/cards.collectible.json"),
        locale: locale,
      );

  Uri getCardArtUri({
    @required HearthstoneJsonApiCard card,
    @required HearthstoneJsonApiImageSize size,
    @required HearthstoneJsonApiImageExtension preferredExtension,
  }) =>
      _buildArtRoute(
        size: getImageSizeText(size),
        id: card.id,
        extension: getImageExtensionText(
            size == HearthstoneJsonApiImageSize.ORIG
                ? HearthstoneJsonApiImageExtension.PNG
                : preferredExtension == HearthstoneJsonApiImageExtension.PNG
                    ? HearthstoneJsonApiImageExtension.JPG
                    : preferredExtension),
      );

  Uri getCardTileUri({
    @required HearthstoneJsonApiCard card,
    @required HearthstoneJsonApiImageExtension extension,
  }) =>
      _buildTileRoute(
        id: card.id,
        extension: getImageExtensionText(extension),
      );

  Uri getCardRenderUri({
    @required HearthstoneJsonApiCard card,
    @required HearthstoneJsonApiImageSize preferredSize,
    HearthstoneJsonApiLocale locale = HearthstoneJsonApiLocale.ENUS,
  }) =>
      _buildRenderRoute(
        locale: getLocaleText(locale == HearthstoneJsonApiLocale.ALL
            ? HearthstoneJsonApiLocale.ENUS
            : locale),
        size: getImageSizeText(preferredSize == HearthstoneJsonApiImageSize.ORIG
            ? HearthstoneJsonApiImageSize.X512
            : preferredSize),
        id: card.id,
        extension: getImageExtensionText(HearthstoneJsonApiImageExtension.PNG),
      );
}
