package com.devhat.bbvaofertas.ui.main

import android.Manifest.permission.ACCESS_FINE_LOCATION
import android.content.pm.PackageManager
import androidx.lifecycle.ViewModelProvider
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.devhat.bbvaofertas.R
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.OnMapReadyCallback
import com.google.android.gms.maps.SupportMapFragment
import com.google.android.gms.maps.model.BitmapDescriptorFactory
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.Marker
import com.google.android.gms.maps.model.MarkerOptions
import org.json.JSONObject

class Mapa : Fragment(), OnMapReadyCallback,GoogleMap.OnMarkerClickListener{


    object JSON
    private lateinit var mMap: GoogleMap

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        /*
        Acceso a la ubicación fina del usuario
         */
        ActivityCompat.requestPermissions(this.requireActivity(),
            arrayOf(ACCESS_FINE_LOCATION)
            ,1)
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        var rootView = inflater.inflate(R.layout.mapa_fragment, container, false)

        /*
         * Soporte para el MapFragment, lo añadimos al Fragment Manager
         */
        var mapFragment : SupportMapFragment? = childFragmentManager.findFragmentById(R.id.mapita) as? SupportMapFragment
        mapFragment?.getMapAsync(this)
        return rootView
    }


    override fun onMapReady(googleMap: GoogleMap) {
        mMap = googleMap
        /*
        Tipos de mapa que se va a mostrar, por ahí tengo un JSON personalizado para darle un diseño especial al mapa
         */
        // mMap.setMapType(GoogleMap.MAP_TYPE_HYBRID)
        // mMap.setMapType(GoogleMap.MAP_TYPE_SATELLITE)
        // mMap.setMapType(GoogleMap.MAP_TYPE_TERRAIN)
        // mMap.setMapType(GoogleMap.MAP_TYPE_NONE)

        if (ContextCompat.checkSelfPermission(this.context!!, android.Manifest.permission.ACCESS_FINE_LOCATION) ==
            PackageManager.PERMISSION_GRANTED &&
            ContextCompat.checkSelfPermission(this.context!!, android.Manifest.permission.ACCESS_COARSE_LOCATION) ==
            PackageManager.PERMISSION_GRANTED) {



            mMap.mapType = GoogleMap.MAP_TYPE_NORMAL // TIPO DE MAPA, NORMAL

            /*
            * Elementos UI de google maps activados o desactivados
            */
            googleMap.isMyLocationEnabled = true
            googleMap.uiSettings.isMyLocationButtonEnabled = true
            mMap.isTrafficEnabled = true
            mMap.uiSettings.isZoomControlsEnabled = false
            mMap.uiSettings.isCompassEnabled = true
            mMap.uiSettings.isRotateGesturesEnabled = true
            mMap.uiSettings.isZoomGesturesEnabled = true

            /*
            * Para añadir un listener a los markers
            */

            mMap.setOnMarkerClickListener(this)


        } else {

            /*Indicar que no tengo permisos de ubicación*/
            Toast.makeText(this.context, "No tengo permisos de ubicación", Toast.LENGTH_LONG).show();
        }

        /*Json de prueba, espera uno mediante un api request*/

        /*Tratar con el JSON y colocar Markers con base a su latitud y longitud*/

        /*
        val jsonfile: String = this.context!!.assets.open("AlmacenesAndroid.json").bufferedReader().use {it.readText()}
        var jsonObject = JSONObject(jsonfile)
        var item1:JSONObject = jsonObject.getJSONObject("CLUES")
        var item2:JSONObject = jsonObject.getJSONObject("LATITUD")
        var item3: JSONObject = jsonObject.getJSONObject("LONGITUD")
        var keys = item1.keys()


        while(keys.hasNext()) {
            var keia = keys.next()
            println("Valor clave es $keia")
            var clues = item1.getString("$keia")
            var lat = item2.getDouble("$keia")
            var log = item3.getDouble("$keia")
            when("$keia".toInt()){
                in 1..300 -> mMap.addMarker(
                    MarkerOptions().position(LatLng(lat, log))
                    .icon(BitmapDescriptorFactory.defaultMarker(BitmapDescriptorFactory.HUE_AZURE)).snippet(clues).title(clues))
                in 300..400 ->  mMap.addMarker(MarkerOptions().position(LatLng(lat, log))
                    .icon(BitmapDescriptorFactory.defaultMarker(BitmapDescriptorFactory.HUE_BLUE)).snippet(clues).title(clues))
                in 400..3000 ->  mMap.addMarker(MarkerOptions().position(LatLng(lat, log))
                    .icon(BitmapDescriptorFactory.defaultMarker(BitmapDescriptorFactory.HUE_GREEN)).snippet(clues).title(clues))
                in 3000..10000 ->  mMap.addMarker(MarkerOptions().position(LatLng(lat, log))
                    .icon(BitmapDescriptorFactory.defaultMarker(BitmapDescriptorFactory.HUE_ORANGE)).snippet(clues).title(clues))
                in 10000..30000 ->  mMap.addMarker(MarkerOptions().position(LatLng(lat, log))
                    .icon(BitmapDescriptorFactory.defaultMarker(BitmapDescriptorFactory.HUE_ROSE)).snippet(clues).title(clues))
                in 30000..35000 ->  mMap.addMarker(MarkerOptions().position(LatLng(lat, log))
                    .icon(BitmapDescriptorFactory.defaultMarker(BitmapDescriptorFactory.HUE_YELLOW)).snippet(clues).title(clues))
                else -> {
                    mMap.addMarker(MarkerOptions().position(LatLng(lat, log))
                        .icon(BitmapDescriptorFactory.defaultMarker(BitmapDescriptorFactory.HUE_VIOLET)).snippet(clues).title(clues))
                }
            }
        }*/


    }

    /*
    Para cuando un marker se seleccione, desplegar el cardview o el nuevo activity con la info de ese marker.
     */
    override fun onMarkerClick(p0: Marker?): Boolean {
        return true
    }



}