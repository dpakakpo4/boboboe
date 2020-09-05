class CountryModel {
  String code;
  String name;
  String imgUrl;

  CountryModel.codName(String code, String name) {
    this.code = code;
    this.name = name;
    // this.imgUrl = "https://www.countryflags.io/" + code + "/shiny/64.png";
    this.imgUrl =
        "http://www.geognos.com/api/en/countries/flag/" + code + ".png";
  }
}
