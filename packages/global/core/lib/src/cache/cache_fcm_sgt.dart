class CacheFcmSgt {
  static final CacheFcmSgt instance = CacheFcmSgt._internal();
  factory CacheFcmSgt() => instance;
  CacheFcmSgt._internal();

  static late final fcmBox;

  Future<bool> saveNoti({
    required String key,
    required String value,
  }) async{
    try{
      await fcmBox.put(key, value);
      return true;
    } catch(_){
      return false;
    }
  }


  Future<String?> getNoti({
    required String key,
  }) async{
    await _futureDelay(50);
    return fcmBox.get(key);
  }


  Future<void> _futureDelay(int milliseconds) async{
    await Future.delayed(Duration(milliseconds: milliseconds));
  }

}