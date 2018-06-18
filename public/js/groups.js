var map;
var marks_data = [];
var markers = [];
function initMap() {

  // General Map
  var nthu = { lat: 24.794296, lng: 120.992684 };
  map = new google.maps.Map(
    document.getElementById('map'), { zoom: 15, center: nthu });
  drop();

  var insertMap = new google.maps.Map(
    document.getElementById('map-insert'), { zoom: 15, center: nthu });

  // Insert location
  var marker = new google.maps.Marker({
    position: nthu,
    map: insertMap,
    draggable: true,
    title: "Drag me!"
  });

  document.getElementById('latitude_input').value = marker.position.lat();
  document.getElementById('longitude_input').value = marker.position.lng();

  google.maps.event.addListener(marker, 'dragend', function () {
    document.getElementById('latitude_input').value = marker.position.lat();
    document.getElementById('longitude_input').value = marker.position.lng();
  });

}

function drop() {
  for (var i = 0; i < marks_data.length; i++) {
    addMarkerWithTimeout(marks_data[i], i * 1000);
  }
}

function addMarkerWithTimeout(data, timeout) {
  window.setTimeout(function () {
    markers.push(new google.maps.Marker({
      position: {
        lat: parseFloat(data.lat),
        lng: parseFloat(data.lng)
      },
      map: map,
      label: {
        fontWeight: 'bold',
        text: data.title,
      },
      animation: google.maps.Animation.DROP
    }));
  }, timeout);
}
