class AllImages {
  AllImages._();

  static final AllImages _instance = AllImages._();

  factory AllImages() => _instance;
  String image = 'assets/images';
  String defaultImage = 'https://www.alldaydr.com/app/images/no_image.png';
  String loaderImage =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Loader.gif/480px-Loader.gif';
}
