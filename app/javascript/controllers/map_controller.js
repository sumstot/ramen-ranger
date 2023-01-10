import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {

  static get values() {
    return {
      apiKey: String,
      markers: Array
    }
  }
  connect() {
    console.log(`Map controller connected`)

    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({ container: this.element, style: "mapbox://styles/mapbox/streets-v10"
    })

    this.addMarkersToMap()
    this.fitMapToMarkers()

  }
  /////////////// Private ///////////////
  addMarkersToMap() {
  this.markersValue.forEach((marker) =>{
    new mapboxgl.Marker()
    .setLngLat([marker.lng, marker.lat])
    .addTo(this.map)
  })
  }

  fitMapToMarkers(){
  const bounds = new mapboxgl.LngLatBounds()
  this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
  this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
