import 'dart:async';

import 'package:mybank/utils/network_util.dart';
import 'package:mybank/model/user.dart';
import 'package:mybank/model/session.dart';

class ApiHelper {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "https://demo0191215.mockable.io/api/v1";
  static final OUTH_TOKEN_URL = BASE_URL + "/oauth/token";
  static final USER_PROFILE = BASE_URL + "/userprofile";
  static final LOGIN_URL = BASE_URL + "/Login";
  static final _API_KEY = "somerandomkey";

  Future<Session> token(String username, String password) {
    return _netUtil.post(OUTH_TOKEN_URL, header: {
      // "token": _API_KEY,
      "username": username,  //test@mybank.com
      "password": password  //1234
    }).then((dynamic res) {
      print(res.toString());
      if(res["error"]) throw new Exception(res["error_msg"]);
      return new Session.map(res); // user response is as given below
    });
  }

  Future<User> Proile(String username, String password) {
    return _netUtil.post(USER_PROFILE, header: {
      "access_token": _API_KEY,// Access token from Session API
    }).then((dynamic res) {
      print(res.toString());
      if(res["error"]) throw new Exception(res["error_msg"]);
      return new User.map(res);
      //return new User.map(res["user"]);
    });
  }

  Future<User> login(String username, String password) {
Map<String,String> headers ={
      "access_token": "yvMbx_TgwdYE0hgOVb8N4ZOvxOukqfjzYOGRZcJiCjQuRGkVIBfjjV3YG4zKTGiY2aPn2cQTGaQOT8uo5uo7_QOXts1s5UBSVuRHc6a8X30RrGBTyqV9h26SUHcZPNbZ"// Access token from Session API
    };

    return _netUtil.post(LOGIN_URL, header:headers ).then((dynamic res) {
      print(res.toString());
      if(res["error"]) throw new Exception(res["error_msg"]);
      return new User.map(res["user"]);
    });
  }
}

/*
* {
	"results": [{
		"gender": "female",
		"name": {
			"title": "mrs",
			"first": "pola",
			"last": "forseth"
		},
		"location": {
			"street": "østerdalsgata 1311",
			"city": "geithus",
			"state": "møre og romsdal",
			"postcode": "8852",
			"coordinates": {
				"latitude": "53.1874",
				"longitude": "116.2392"
			},
			"timezone": {
				"offset": "-5:00",
				"description": "Eastern Time (US & Canada), Bogota, Lima"
			}
		},
		"email": "pola.forseth@example.com",
		"login": {
			"uuid": "c3a44f36-0bb6-483e-86b0-f91c241fdcac",
			"username": "angryzebra649",
			"password": "pitures",
			"salt": "RSzIo6sx",
			"md5": "ee555813cfd868048259ffdeab7ff6ec",
			"sha1": "458680074ccd6bf81cadc9e4aedb4ccd927b8650",
			"sha256": "a6baa646dde65a240cf26891a8c8befa911faa0c5cd6ec7acab46376776eaa68"
		},
		"dob": {
			"date": "1950-11-23T12:12:12Z",
			"age": 67
		},
		"registered": {
			"date": "2015-05-03T20:43:35Z",
			"age": 3
		},
		"phone": "30987676",
		"cell": "46521902",
		"id": {
			"name": "FN",
			"value": "23115031597"
		},
		"picture": {
			"large": "https://randomuser.me/api/portraits/women/14.jpg",
			"medium": "https://randomuser.me/api/portraits/med/women/14.jpg",
			"thumbnail": "https://randomuser.me/api/portraits/thumb/women/14.jpg"
		},
		"nat": "NO"
	}],
	"info": {
		"seed": "290b3110df0e9d68",
		"results": 1,
		"page": 1,
		"version": "1.2"
	}
}
*
* */