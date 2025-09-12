class PlaceModel {
  final String placeName;
  final String placeImage;
  PlaceModel({required this.placeName, required this.placeImage});
  static final List<PlaceModel> places = [
    PlaceModel(
      placeName: "غرفة معيشة",
      placeImage: "assets/places_images/bedroom.svg",
    ),
    PlaceModel(
      placeName: "ًصالون",
      placeImage: "assets/places_images/salon.svg",
    ),
    PlaceModel(
      placeName: "مكتب",
      placeImage: "assets/places_images/office.svg",
    ),
    PlaceModel(
      placeName: "حمام",
      placeImage: "assets/places_images/bathroom.svg",
    ),
    PlaceModel(
      placeName: "مطبخ",
      placeImage: "assets/places_images/kitchen.svg",
    ),
    PlaceModel(
      placeName: "سرير",
      placeImage: "assets/places_images/bedroom.svg",
    ),
  ];
}
