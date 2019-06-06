var animal = {
  name: 'Pumbaa',
  species: 'Phacochoerus africanus',
};

var menagerie = {
  warthog: animal,
  // reference to object at animal

};

animal = {
  name: 'Timom',
  species: 'Suricata suricatta',
};
// animal references a new object

menagerie.meerkat = animal;
// new proprety created

menagerie.warthog === animal; // false
menagerie.meerkat === animal; // true