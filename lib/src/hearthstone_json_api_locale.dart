/// All available locales
enum HearthstoneJsonApiLocale {
  ALL,
  DEDE,
  ENUS,
  ESES,
  ESMX,
  FRFR,
  ITIT,
  JAJP,
  KOKR,
  PLPL,
  PTBR,
  RURU,
  THTH,
  ZHCN,
  ZHTW,
}

/// Converts [HearthstoneJsonApiLocale] enum into a properly capitilized [String]
String getLocaleText(HearthstoneJsonApiLocale locale) {
  switch (locale) {
    case HearthstoneJsonApiLocale.DEDE:
      return "deDE";
    case HearthstoneJsonApiLocale.ENUS:
      return "enUS";
    case HearthstoneJsonApiLocale.ESES:
      return "esES";
    case HearthstoneJsonApiLocale.ESMX:
      return "esMX";
    case HearthstoneJsonApiLocale.FRFR:
      return "frFR";
    case HearthstoneJsonApiLocale.ITIT:
      return "itIT";
    case HearthstoneJsonApiLocale.JAJP:
      return "jaJP";
    case HearthstoneJsonApiLocale.KOKR:
      return "koKR";
    case HearthstoneJsonApiLocale.PLPL:
      return "plPL";
    case HearthstoneJsonApiLocale.PTBR:
      return "ptBR";
    case HearthstoneJsonApiLocale.RURU:
      return "ruRU";
    case HearthstoneJsonApiLocale.THTH:
      return "thTH";
    case HearthstoneJsonApiLocale.ZHCN:
      return "zhCN";
    case HearthstoneJsonApiLocale.ZHTW:
      return "zhTW";
    default:
      return "all";
  }
}
