import 'dart:convert';

//Model class that maps the JSON response data from the API into a model.
class HikeModel {
  int id, specialForm;
  List img, reserveTypes;
  var date, price, questionnaire, questExplanation;
  String title,
      interest,
      address,
      trainerName,
      trainerImage,
      trainerInfo,
      occasionDetail,
      latitude,
      longitude;
  bool isLiked, isSold, isPrivateEvent, hiddenCashPayment;

  HikeModel(
      {this.id,
      this.specialForm,
      this.img,
      this.reserveTypes,
      this.date,
      this.price,
      this.questionnaire,
      this.questExplanation,
      this.title,
      this.interest,
      this.address,
      this.trainerName,
      this.trainerImage,
      this.trainerInfo,
      this.occasionDetail,
      this.latitude,
      this.longitude,
      this.isLiked,
      this.isSold,
      this.isPrivateEvent,
      this.hiddenCashPayment});

  factory HikeModel.fromJson(String json) {
    var decodedJson = jsonDecode(json);
    return HikeModel(
      id: decodedJson['id'],
      title: decodedJson['title'],
      img: decodedJson['img'],
      interest: decodedJson['interest'],
      price: decodedJson['price'],
      date: decodedJson['date'],
      address: decodedJson['address'],
      trainerName: decodedJson['trainerName'],
      trainerImage: decodedJson['trainerImg'],
      trainerInfo: decodedJson['trainerInfo'],
      occasionDetail: decodedJson['occasionDetail'],
      latitude: decodedJson['latitude'],
      longitude: decodedJson['longitude'],
      isLiked: decodedJson['isLiked'],
      isSold: decodedJson['isSold'],
      isPrivateEvent: decodedJson['isPrivateEvent'],
      hiddenCashPayment: decodedJson['hiddenCashPayment'],
      specialForm: decodedJson['specialForm'],
      questionnaire: decodedJson['questionnaire'],
      questExplanation: decodedJson['questExplanation'],
      reserveTypes: decodedJson['reservTypes'],
    );
  }
}
