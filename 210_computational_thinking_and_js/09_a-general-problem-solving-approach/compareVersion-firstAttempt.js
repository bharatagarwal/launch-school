// input strings
// output integer

// split both arrays according to integer
// fill out smaller array with zeroes to equal length of larger array
// compare first index, and if equal, compare next index
// return 1 if v1>v2, return -1 if v1<v2
// return 0 if no return called

function compareVersions(version1, version2) {
  if (version1.match(/[^0-9\.]/) || version2.match(/[^0-9\.]/)) {
    return null;
  }

  let ver1Array = version1.split('.').map((a) => parseInt(a, 10));
  let ver2Array = version2.split('.').map((a) => parseInt(a, 10));

  let smallerArray = ver1Array.length <= ver2Array.length ? ver1Array : ver2Array;
  let differenceInLength = Math.abs(ver1Array.length - ver2Array.length);

  let i;
  
  for (i = differenceInLength; i > 0; i -= 1) {
    smallerArray.push(0);
  }

  console.log(ver1Array);
  console.log(ver2Array);

  for (i = 0; i < ver1Array.length; i += 1) {
    if (ver1Array[i] > ver2Array[i]) {
      return 1;
    } else if (ver1Array[i] < ver2Array[i]) {
      return -1;
    }
  }

  return 0;
}

console.log(compareVersions('13.37', '1.18.2')); // 1
console.log(compareVersions('1.2.0.0', '1.18.2')); // -1
console.log(compareVersions('1.2.0.0', '1.2')); // 0
console.log(compareVersions('1', '0.1')); // 1
console.log(compareVersions('11', '1.a.d')) // null


// 0.1 < 1 = 1.0 < 1.1 < 1.2 = 1.2.0.0 < 1.18.2 < 13.37
