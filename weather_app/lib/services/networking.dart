import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    //https://api.openweathermap.org/data/2.5/weather?lat=37.4219983&lon=-122.084&appid=6e339dcfda744209024d520f3be901d5
    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);
      return decodedData;
      // double temp = decodedData['main']['temp'];
      // int condition = decodedData['weather'][0]['id'];
      // String cityName = decodedData['name'];
      //
      // print(temp);
      // print(condition);
      // print(cityName);
      // print(data);
      // var logitude = jsonDecode(data)['coord']['lon'];
      //
      // var weatherDescription = jsonDecode(data)['weather'][0]['description'];
    } else {
      print(response.statusCode);
    }
  }
}
