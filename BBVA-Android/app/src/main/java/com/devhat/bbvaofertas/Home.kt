package com.devhat.bbvaofertas

import android.annotation.SuppressLint
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.LinearLayout
import android.widget.TextView
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.devhat.bbvaofertas.notificaciones.Notificaciones
import com.devhat.bbvaofertas.notificaciones.NotificationsAdapter
import com.devhat.bbvaofertas.ofertas.Ofertas
import com.devhat.bbvaofertas.ofertas.OfertasAdapter

// TODO: Rename parameter arguments, choose names that match
// the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
private const val ARG_PARAM1 = "param1"
private const val ARG_PARAM2 = "param2"

/**
 * A simple [Fragment] subclass.
 * Use the [Home.newInstance] factory method to
 * create an instance of this fragment.
 */
class Home : Fragment() {
    // TODO: Rename and change types of parameters
    private var param1: String? = null
    private var param2: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        arguments?.let {
            param1 = it.getString(ARG_PARAM1)
            param2 = it.getString(ARG_PARAM2)
        }
    }

    @SuppressLint("WrongConstant")
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val rootView = inflater.inflate(R.layout.fragment_home, container, false)
        val recyclerView : RecyclerView = rootView.findViewById(R.id.recycler)
        recyclerView.layoutManager = LinearLayoutManager(rootView.context, LinearLayout.VERTICAL, false )
        val ofertas = ArrayList<Ofertas>()
        ofertas.add(Ofertas(R.drawable.auto,"Honda Aereopuerto", "Estrena un auto con este crédito preaprobado por $400,000.00", "Vigencia: 15 de noviembre", true))
        ofertas.add(Ofertas(R.drawable.liverpool,"Liverpool", "30% de descuento en todos los departamentos", "Vigencia: 30 de octubre", false))
        for(num in 1..10)
            ofertas.add(Ofertas(R.drawable.home1,"Palacio de Hierro", "50% de descuento el la venta nocturna", " Vigencia: num de mayo", false))
        recyclerView.adapter = OfertasAdapter(ofertas)
        return rootView;
    }

    override fun onResume() {
        super.onResume()
        val title: TextView? = activity?.findViewById(R.id.title)
        //if (title != null) title.text = "Bienvenido"
    }
}