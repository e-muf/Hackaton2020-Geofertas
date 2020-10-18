package com.devhat.bbvaofertas.notificaciones

import android.content.Intent
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.devhat.bbvaofertas.R
import com.devhat.bbvaofertas.DetailOferta

class NotificationsAdapter(var list: ArrayList<Notificaciones>): RecyclerView.Adapter<NotificationsAdapter.ViewHolder>(){

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view){
        fun bindItems(data: Notificaciones){
            val text_tienda : TextView = itemView.findViewById(R.id.text_tienda)
            val text_promocion : TextView = itemView.findViewById(R.id.text_promocion)
            val text_vigencia : TextView = itemView.findViewById(R.id.text_vigencia)

            text_tienda.text = data.tienda
            text_promocion.text = data.promocion
            text_vigencia.text = data.vigencia

            itemView.setOnClickListener{
                val context=itemView.context
                val intent = Intent( context, DetailOferta::class.java)
                context.startActivity(intent)
            }
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val v = LayoutInflater.from(parent?.context).inflate(R.layout.item_notificacion, parent,false)
        return  ViewHolder(v)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        holder.bindItems(list[position])
    }

    override fun getItemCount(): Int {
        return list.size
    }
}