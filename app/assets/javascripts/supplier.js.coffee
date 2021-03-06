$ ->
  $('body.suppliers form.new_supplier, body.suppliers form.edit_supplier').submit (event) ->
    event.preventDefault()
    geocoder = new google.maps.Geocoder
    params =
      address: $('input#supplier_address').val()
      region: 'uk'
    form = this
    geocoder.geocode params, (results, status) ->
      if status == google.maps.GeocoderStatus.OK
        latLng = results[0].geometry.location
        $('input#supplier_latitude').val latLng.lat()
        $('input#supplier_longitude').val latLng.lng()
      form.submit()