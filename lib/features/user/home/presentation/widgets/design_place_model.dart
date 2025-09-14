class DesignPlaceModel {
  final String designName;
  final String designImage;
  DesignPlaceModel({required this.designName, required this.designImage});
  static final List<DesignPlaceModel> designs = [
    DesignPlaceModel(
      designName: "ريفي",
      designImage: "assets/design/rustic.png",
    ),
    DesignPlaceModel(
      designName: "مودرن",
      designImage: "assets/design/modern.png",
    ),
    DesignPlaceModel(
      designName: "كلاسيك",
      designImage: "assets/design/classic.png",
    ),
    DesignPlaceModel(
      designName: "بوهيمي",
      designImage: "assets/design/bohemian.png",
    ),
    DesignPlaceModel(
      designName: "مينيمالي",
      designImage: "assets/design/minimalist.png",
    ),
    DesignPlaceModel(
      designName: "عصري",
      designImage: "assets/design/contemporary.png",
    ),
  ];
}
