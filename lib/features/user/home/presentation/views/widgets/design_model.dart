class DesignModel {
  final String designName;
  final String designImage;
  DesignModel({required this.designName, required this.designImage});
  static final List<DesignModel> designs = [
    DesignModel(designName: "ريفي", designImage: "assets/design/rustic.png"),
    DesignModel(designName: "مودرن", designImage: "assets/design/modern.png"),
    DesignModel(designName: "كلاسيك", designImage: "assets/design/classic.png"),
    DesignModel(
      designName: "بوهيمي",
      designImage: "assets/design/bohemian.png",
    ),
    DesignModel(
      designName: "مينيمالي",
      designImage: "assets/design/minimalist.png",
    ),
    DesignModel(
      designName: "عصري",
      designImage: "assets/design/contemporary.png",
    ),
  ];
}
