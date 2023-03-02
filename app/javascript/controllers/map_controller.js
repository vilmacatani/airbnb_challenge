import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
  this.map = new mapboxgl.Map({
    container: this.element,
    style: 'mapbox://styles/mapbox/dark-v11', // style URL
    center: [0, 0],
    zoom: 0.8, // starting zoom
  });

  this.#addMarkersToMap()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }
}
