enum HearthstoneJsonApiImageExtension {
  PNG,
  JPG,
  WEBP,
}

/// Converts [HearthstoneJsonApiImageExtension] enum into a properly capitilized [String]
String getImageExtensionText(HearthstoneJsonApiImageExtension extension) {
  switch (extension) {
    case HearthstoneJsonApiImageExtension.WEBP:
      return "webp";
    case HearthstoneJsonApiImageExtension.JPG:
      return "jpg";
    default:
      return "png";
  }
}
