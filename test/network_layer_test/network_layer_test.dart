import 'package:test/test.dart';

import 'fack_network_layer.dart';
import 'fack_request.dart';

void main() {
  group("Network Layer Testing", () {
    test("Test Get Request", () {
      FackNetworkLayer _fackNL = FackNetworkLayer();
      FackNetworkRequest _fackRequest = FackNetworkRequest("");
      final response = _fackNL.get(_fackRequest);
      expect(response, {});
    });

    test("Test Post Request", () {
      FackNetworkRequest _fackRequest = FackNetworkRequest("");
      FackNetworkLayer _fackNL = FackNetworkLayer();
      final response = _fackNL.post(_fackRequest);
      expect(response, {});
    });
  });
}
