abstract class CLientMapSeekerEvent{}

class ClientMapSeekerInitEvent extends CLientMapSeekerEvent{}
class FindPosition extends CLientMapSeekerEvent{}
class ChangeMapCameraPosition extends CLientMapSeekerEvent{
  final double lat;
  final double lng;

  ChangeMapCameraPosition({
    required this.lat,
    required this.lng
});
}
