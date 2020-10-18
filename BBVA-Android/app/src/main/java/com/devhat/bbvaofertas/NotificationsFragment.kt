package com.devhat.bbvaofertas

import android.annotation.SuppressLint
import androidx.lifecycle.ViewModelProviders
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.LinearLayout
import android.widget.TextView
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.devhat.bbvaofertas.notificaciones.Notificaciones
import com.devhat.bbvaofertas.notificaciones.NotificationsAdapter

class NotificationsFragment : Fragment() {

    companion object {
        fun newInstance() = NotificationsFragment()
    }

    private lateinit var viewModel: NotificationsViewModel

    @SuppressLint("WrongConstant")
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val rootView = inflater.inflate(R.layout.notifications_fragment, container, false)
        val recyclerView : RecyclerView = rootView.findViewById(R.id.recycler)
        recyclerView.layoutManager = LinearLayoutManager(rootView.context, LinearLayout.VERTICAL, false )
        val notificaciones = ArrayList<Notificaciones>()
        notificaciones.add(Notificaciones("Honda Aereopuerto", "Estrena un auto con este crédito preaprobado por $400,000.00", "Vigencia: 15 de noviembre", true))
        notificaciones.add(Notificaciones("Liverpool", "30% de descuento en todos los departamentos", "Vigencia: 30 de octubre", false))
        notificaciones.add(Notificaciones("Palacio de Hierro", "Palacio de Hierro y BBVA te consienten con 20% de descuento en ropa de temporada", " Vigencia: num de mayo", false))
        notificaciones.add(Notificaciones("Sam's Club", "100 puntos de bonificación si pagas con tu tarjeta Platinum", " Vigencia: num de mayo", false))
        notificaciones.add(Notificaciones("Ford", "Obtenen el carro de tus sueños, con un crédito", " Vigencia: num de mayo", false))
        notificaciones.add(Notificaciones("Famsa", "50% de descuento en áŕea de cómputo con tu tarjeta Gold", " Vigencia: num de mayo", false))
        for(num in 1..10)
            notificaciones.add(Notificaciones("Liverpool", "50% de descuento el la venta nocturna", " Vigencia: num de mayo", false))
        //notificaciones.add(Notificaciones("Palacio", "50% de descuento el la venta nocturna", " Vigencia: 6 de mayo"))
        recyclerView.adapter = NotificationsAdapter(notificaciones)
        recyclerView.addItemDecoration(DividerItemDecoration(rootView.context, LinearLayoutManager.VERTICAL))
        return rootView;
    }

    override fun onResume() {
        super.onResume()
        val title: TextView? = activity?.findViewById(R.id.title)
        //if (title != null) title.text = "Notificaciones"
    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)
        viewModel = ViewModelProviders.of(this).get(NotificationsViewModel::class.java)
        // TODO: Use the ViewModel
    }

}