# ESV API Client for Dart

[![pub package](https://img.shields.io/pub/v/esv_api.svg)](https://pub.dartlang.org/packages/esv_api)
[![travis-ci](https://api.travis-ci.org/tsteward/esv_api_dart.svg?branch=master)](https://travis-ci.org/tsteward/esv_api_dart)

A Dart client for the ESV API from Crossway. Can be used to download scripture
from the ESV Bible. Documentation of the API and more details can be found at
<https://api.esv.org/>.

An API key is required to use the API. You can get an API key by creating a new
API application on the [ESV API website](https://api.esv.org/account/).

## Usage

To use the example below, you will need to replace the text "Insert API Key
Here".

Example:

```dart
import 'package:esv_api/esv_api.dart';

main() async {
  var esvApi = new ESVAPI('Insert API Key Here');

  var response = await esvApi.getPassageText('John 11:35',
      include_short_copyright: false, include_copyright: true);

  print(response.passages.first);
}
```

Example Output:

```
John 11:35

  [35] Jesus wept.

The Holy Bible, English Standard Version® (ESV®), copyright © 2001 by Crossway, a publishing ministry of Good News Publishers. Used by permission. All rights reserved.
```

## Contributing

This currently only implements passage text endpoint of the API. If you would
like to implement other parts of the API, feel free to make a [Github pull
request](https://github.com/tsteward/esv_api_dart/pulls).

This projected uses generated code for JSON serialization. If download Git
repository, you will need to generate these files using
`pub run build_runner build`.
