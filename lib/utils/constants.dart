const String appName = "Let Him Cook";

enum HttpRequestType { GET, POST, PUT, DELETE }

enum BottomTabEnum {
  home(0),
  favourites(1),
  settings(2);

  const BottomTabEnum(this.value);
  final int value;
}
