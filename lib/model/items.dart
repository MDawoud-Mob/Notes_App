class Items {
   int? _id;
   String? _group;
   String? _type;
   int? _selling;
   int? _buying;
  Items.init();
  Items(dynamic obj){
      _id = obj['id'];
      _group = obj['group'];
    _type = obj['type'];
    _selling = obj['selling'];
    _buying = obj['buying'];

  }
    Map<String, dynamic> toMap() =>
     {'id' : _id,'group' : _group,'type' : _type, 'selling' : _selling,'buying':_buying};
    int? get id => _id;
    String? get group => _group;
    String? get type=> _type;
      int? get selling => _selling;
  int? get buying => _buying;

}
