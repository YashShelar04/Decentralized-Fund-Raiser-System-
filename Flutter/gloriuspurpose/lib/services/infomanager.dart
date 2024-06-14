import 'package:shared_preferences/shared_preferences.dart';

class Infomanager
{

  static late SharedPreferences prefs;

  static initializePrefs() async{
    prefs = await SharedPreferences.getInstance();
  }

  static storeKeys(String privateKey,String accountAddress) async{
    await prefs.setString("privateKey", privateKey);
    await prefs.setString("accountAddress", accountAddress);
  }

  static String getPrivateKey() {
    String privateKey = prefs.getString("privateKey") ?? "";
    return privateKey;
  }

  static String getAccountAddress() {
    String accountAddress = prefs.getString("accountAddress") ?? "";
    return accountAddress;
  }


}