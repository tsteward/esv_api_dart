import 'package:esv_api/esv_api.dart';

main() async {
  var esvApi = new ESVAPI('Insert API Key Here');

  var response = await esvApi.getPassageText('John 11:35',
      include_short_copyright: false, include_copyright: true);

  print(response.passages.first);
}
