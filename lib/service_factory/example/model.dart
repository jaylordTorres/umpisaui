import '../bloc_factory.dart';

class SampleViewModel extends SViewModel<int> {
  final dynamic data;
  final int id;
  final String createdAt;
  SampleViewModel({data})
      : data = data,
        id = data['id'],
        createdAt = data['createdAt'],
        super(key: data['id']);

  static SampleViewModel create(SeGetResponse response) {
    return SampleViewModel(data: response.data);
  }

  static List<SampleViewModel> fromListResponseData(
      SeGetListResponse response) {
    print(response);
    return response.data
        .map<SampleViewModel>((e) => SampleViewModel(data: e))
        .toList();
  }
}

// {
//     "isActive": true,
//     "id": 0,
//     "user": {
//       "isActive": true,
//       "id": 0,
//       "email": "string",
//       "firstName": "string",
//       "lastName": "string",
//       "azureUUID": "string",
//       "hasPasswordChanged": true,
//       "hasAgreedPrivacyPolicy": true,
//       "contactNumber": "string",
//       "nickname": "string",
//       "photoUrl": "string"
//     },
//     "address": "string",
//     "address2": "string",
//     "city": "string",
//     "province": "string",
//     "country": "string",
//     "zipcode": "string",
//     "company": "string"
//   }
