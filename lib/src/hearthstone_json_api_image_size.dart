enum HearthstoneJsonApiImageSize {
  ORIG,
  X256,
  X512,
}

/// Converts [HearthstoneJsonApiImageSize] enum into a properly capitilized [String]
String getImageSizeText(HearthstoneJsonApiImageSize size) {
  switch (size) {
    case HearthstoneJsonApiImageSize.ORIG:
      return "orig";
    case HearthstoneJsonApiImageSize.X256:
      return "256x";
    default:
      return "512x";
  }
}
