class AddressVO{
  final String address;
  final String dong;
  final GpsVO coordinate;
  const AddressVO({
    required this.address,
    required this.dong,
    required this.coordinate,
  });
}

class GpsVO{
  final double lat;
  final double lnt;
  const GpsVO({
    required this.lat,
    required this.lnt
  });
}