import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.map.on('load', () => {
      this.#addMarkersToMap()
      this.#addLineToMap()
      this.#fitMapToMarkers()
    })
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      const color = marker.is_first ? '#00ff00' : '#ff0000' // Grün für den ersten Marker, Rot für andere

      new mapboxgl.Marker({ color })
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #addLineToMap() {
    // Marker nach Zeitstempel sortieren
    const sortedMarkers = this.markersValue.sort((a, b) => a.timestamp - b.timestamp)
    const coordinates = sortedMarkers.map(marker => [marker.lng, marker.lat])
    console.log('Adding line with coordinates:', coordinates) // Debugging

    this.map.addSource('line', {
      'type': 'geojson',
      'data': {
        'type': 'FeatureCollection',
        'features': [{
          'type': 'Feature',
          'geometry': {
            'type': 'LineString',
            'coordinates': coordinates
          }
        }]
      }
    })

    this.map.addLayer({
      'id': 'line',
      'type': 'line',
      'source': 'line',
      'layout': {},
      'paint': {
      'line-color': '#000000', // Schwarze Farbe
      'line-width': 2,
      'line-dasharray': [4, 2]
      }
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
