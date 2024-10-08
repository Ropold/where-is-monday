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

  // #addMarkersToMap() {
  //   this.markersValue.forEach((marker) => {
  //     const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
  //     const color = marker.is_first ? '#00ff00' : '#ff0000' // Grün für den ersten Marker, Rot für andere

  //     new mapboxgl.Marker({ color })
  //       .setLngLat([marker.lng, marker.lat])
  //       .setPopup(popup)
  //       .addTo(this.map)
  //   })
  // }

  #addMarkersToMap() {
    this.markersValue
    .forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      if (marker.is_first) {
        // Verwende ein benutzerdefiniertes Haus-Icon für den ersten Marker
        const el = document.createElement('div')
        el.className = 'custom-marker'
        el.innerHTML = '<i class="fa-solid fa-house-chimney"></i>' // Pfad zum Haus-Icon
        el.style.fontSize = '30px'


        new mapboxgl.Marker(el)
          .setLngLat([marker.lng, marker.lat])
          .setPopup(popup)
          .addTo(this.map)
      } else {
        // Verwende Standardfarben für andere Marker
        const color = '#ff0000' // Rot für andere Marker
        new mapboxgl.Marker({ color })
          .setLngLat([marker.lng, marker.lat])
          .setPopup(popup)
          .addTo(this.map)
      }
      // Wenn es der letzte Marker ist, füge einen blauen Kreis hinzu
      if (marker.is_last) {
        this.#addCircleToMap(marker)
      }
    })
  }

  #addCircleToMap(marker) {
    // Füge eine GeoJSON-Quelle für den blauen Kreis hinzu
    this.map.addSource(`circle-${marker.lat}-${marker.lng}`, {
      type: 'geojson',
      data: {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [marker.lng, marker.lat]
        }
      }
    })

    // Füge die Kreis-Layer hinzu
    this.map.addLayer({
      id: `circle-${marker.lat}-${marker.lng}`,
      type: 'circle',
      source: `circle-${marker.lat}-${marker.lng}`,
      paint: {
        'circle-radius': 100, // Größe des Kreises in Pixel
        'circle-color': '#0000FF', // Blaue Farbe
        'circle-opacity': 0.4 // Transparenz
      }
    })
  }

  #addLineToMap() {

    console.log('Markers before sorting:', this.markersValue)

    // Filter out markers with invalid coordinates or timestamps
    const validMarkers = this.markersValue.filter(marker => {
      return marker.lng && marker.lat && marker.timestamp
    })

    // Sort markers by timestamp
    const sortedMarkers = validMarkers.sort((a, b) => new Date(a.timestamp) - new Date(b.timestamp))
    // Extract coordinates from sorted markers
    const coordinates = sortedMarkers.map(marker => [marker.lng, marker.lat])

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
