function dms(angle) {
  let degrees = Math.floor(angle);
  let partial = angle - degrees;
  let partialSeconds = Math.round(partial * 3600);
  let minutes = Math.floor(partialSeconds / 60);
  let seconds = partialSeconds - (minutes * 60);
  return `${degrees}°${leadingZero(minutes)}'${leadingZero(seconds)}"`;
}

function leadingZero(number) {
  return number < 10 ? `0${number}` : `${number}`;
}

console.log(dms(30));           // 30°00'00"
console.log(dms(76.73));        // 76°43'48"
console.log(dms(254.6));        // 254°35'59"
console.log(dms(93.034773));    // 93°02'05"
console.log(dms(0));            // 0°00'00"
console.log(dms(360));          // 360°00'00" or 0°00'00"