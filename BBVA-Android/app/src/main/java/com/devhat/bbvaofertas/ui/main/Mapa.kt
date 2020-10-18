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
import com.google.android.gms.maps.CameraUpdateFactory
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.OnMapReadyCallback
import com.google.android.gms.maps.SupportMapFragment
import com.google.android.gms.maps.model.BitmapDescriptorFactory
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.Marker
import com.google.android.gms.maps.model.MarkerOptions
import org.json.JSONObject

class Mapa : Fragment(), OnMapReadyCallback,GoogleMap.OnMarkerClickListener{


    private lateinit var mMap: GoogleMap

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        ActivityCompat.requestPermissions(this.requireActivity(),
            arrayOf(ACCESS_FINE_LOCATION)
            ,1)
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        var rootView = inflater.inflate(R.layout.fragment_maps, container, false)

        var mapFragment : SupportMapFragment? = childFragmentManager.findFragmentById(R.id.mapitas) as? SupportMapFragment
        mapFragment?.getMapAsync(this)
        return rootView
    }


    override fun onMapReady(googleMap: GoogleMap) {
        mMap = googleMap
        if (ContextCompat.checkSelfPermission(this.requireContext(), android.Manifest.permission.ACCESS_FINE_LOCATION) ==
            PackageManager.PERMISSION_GRANTED &&
            ContextCompat.checkSelfPermission(this.requireContext(), android.Manifest.permission.ACCESS_COARSE_LOCATION) ==
            PackageManager.PERMISSION_GRANTED) {
            mMap.mapType = GoogleMap.MAP_TYPE_NORMAL
            googleMap.isMyLocationEnabled = true
            googleMap.uiSettings.isMyLocationButtonEnabled = true
            mMap.isTrafficEnabled = true
            mMap.uiSettings.isZoomControlsEnabled = false
            mMap.uiSettings.isCompassEnabled = true
            mMap.uiSettings.isRotateGesturesEnabled = true
            mMap.uiSettings.isZoomGesturesEnabled = true
            mMap.setOnMarkerClickListener(this)
        }
        mMap.animateCamera(CameraUpdateFactory.newLatLngZoom(LatLng(17.967524, -92.940931),10f))
        mMap.addMarker(MarkerOptions().position(LatLng(17.967524, -92.940931)).icon(BitmapDescriptorFactory.defaultMarker(BitmapDescriptorFactory.HUE_RED)))
    }


    /*
    Para cuando un marker se seleccione, desplegar el cardview o el nuevo activity con la info de ese marker.
     */
    override fun onMarkerClick(p0: Marker?): Boolean {
        return true
    }



}