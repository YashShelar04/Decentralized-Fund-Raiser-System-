import 'dart:convert';

import 'package:gloriuspurpose/apivariables.dart';
import 'package:http/http.dart' as http;

class GeminiApiCall{

  static Future<String> autoCategorizeCampaign(String prompt)async{
    final String filteredMessage = "categorize $prompt from (Health and Medical,Education,Human Services,Environmental,Arts and Culture,Disaster Relief,Animal Welfare,Senior Services,Military Support,Religious,others) just write only one option";
    var reqBody = {
      "contents": [
        {
          "parts": [
            {"text": filteredMessage}
          ]
        }
      ]
    };

    return await hitGemApi(jsonEncode(reqBody),);

  }

  static Future<String> hitGemApi(String reqBody)async{
    final response = await http.post(Uri.parse(gemApi,),body: reqBody,);
    if(response.statusCode == 200){
      final decodedResponse = jsonDecode(response.body);
      final String promptReply = decodedResponse["candidates"][0]['content']["parts"][0]['text'];
      return promptReply;
    }
    else{
      return "";
    }
  }

}