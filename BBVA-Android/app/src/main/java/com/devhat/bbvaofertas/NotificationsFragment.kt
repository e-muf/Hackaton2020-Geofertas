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
        for(num in 1..10)
            notificaciones.add(Notificaciones("Liverpool", "50% de descuento el la venta nocturna", " Vigencia: num de mayo"))
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