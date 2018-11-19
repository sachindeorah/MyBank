class Session {
  String _access_token;
  String _token_type;
  String _refresh_token;
  String _expires_in;
  String _scope;

  Session(this._access_token,this._token_type,this._refresh_token,
      this._expires_in,this._scope);

  Session.map(dynamic obj) {
    this._access_token = obj["access_token"];
    this._token_type = obj["token_type"];
    this._refresh_token = obj["refresh_token"];
    this._expires_in = obj["expires_in"];
    this._scope = obj["scope"];
  }

  String get access_token => _access_token;
  String get token_type => _token_type;
  String get refresh_token =>_refresh_token;
  String get expires_in => _expires_in;
  String get scope => _scope;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["access_token"] = _access_token;
    map["token_type"] = _token_type;
    map["refresh_token"]=_refresh_token;
    map["expires_in"]=_expires_in;
    map["scope"]=_scope;
    return map;
  }
}