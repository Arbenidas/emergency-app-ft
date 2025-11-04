class Blocformitem {

final String? value;
final String? error;


const Blocformitem({
this.value = "",
this.error = "",
});


Blocformitem copyWith({
  String? value,
  String? error
}){
  return Blocformitem(
  value: value ?? this.value,
  error: error ?? this.error,
  ); 
}

}