marker = null

show_marker = (map) ->
  point = the_geom.slice(7, -1).split ' '
  
  map.setView [point[1], point[0]], 15
  L.control.scale().addTo map
  
  marker = L.marker([point[1], point[0]]).addTo(map).bindPopup(area).openPopup()
  
  
$(document).live 'pagebeforeload', ->
  delete the_geom
  delete area
  
$(document).live 'pageshow', ->
  if $('#map_view').length
    map = L.map 'map_view'
    $ -> show_marker map
  
  
  if $('#map').length
    map = L.map 'map'
    
    if typeof the_geom == 'undefined'
      map.fitWorld()
    else
      $ -> show_marker map
    
    $('#get_location').click ->
      map.on 'locationerror', (e) ->
        alert e.message
        map.fitWorld()
          
      map.on 'locationfound', (e) ->
        if marker != null
          map.removeLayer marker

        radius = e.accuracy / 2
        marker = L.marker(e.latlng).addTo(map).bindPopup("Você está num raio de " + radius + " metros a partir deste ponto.").openPopup()
        L.circle(e.latlng, radius).addTo map
        
        $('#inspection_the_geom').val 'POINT(' + e.latlng.lng + ' ' + e.latlng.lat + ')'
  
      map.locate
        setView: true
        maxZoom: 18
   
        
  if typeof map != 'undefined'
    L.tileLayer('http://{s}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/997/256/{z}/{x}/{y}.png'
      attribution: 'Map data © OpenStreetMap contributors').addTo map