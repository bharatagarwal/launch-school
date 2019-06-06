function compareVersions(versionA, versionB) {
  var validChars = /^[0-9]+(\.[0-9]+)*$/;
  if (!validChars.test(versionA) || !validChars.test(versionB)) {
    return null;
  }

  var aParts = versionA.split('.').map(Number);
  var bParts = versionB.split('.').map(Number);
  var maxLength = Math.max(aParts.length, bParts.length)

  var i;
  var aValue;
  var bValue;
  
  for (i = 0; i < maxLength; i += 1) {
    aValue = aParts[i] || 0;
    bValue = bParts[i] || 0;

    if (aValue > bValue) {
      return 1;
    } else if (aValue < bValue) {
      return -1;
    }
  }

  return 0;
  
}

console.log(compareVersions('1', '1'));            // 0
console.log(compareVersions('1.1', '1.0'));        // 1
console.log(compareVersions('2.3.4', '2.3.5'));    // -1
console.log(compareVersions('1.a', '1'));          // null
console.log(compareVersions('.1', '1'));           // null
console.log(compareVersions('1.', '2'));           // null
console.log(compareVersions('1..0', '2.0'));       // null
console.log(compareVersions('1.0', '1.0.0'));      // 0
console.log(compareVersions('1.0.0', '1.1'));      // -1
console.log(compareVersions('1.0', '1.0.5'));      // -1