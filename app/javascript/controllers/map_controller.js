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
    zoom: 4, // starting zoom
  });

  this.#addMarkersToMap()
  this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html
      // customMarker.style.height = "30px",
      // customMarker.style.width = "30px",
      // customMarker.style.backgroundImage = `${ABNB.png}`
      // customMarker.style.backgroundSize = "contain"

      new mapboxgl.Marker({element: customMarker})
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map);
      })
  }
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 9, duration: 0 })
  }
}
