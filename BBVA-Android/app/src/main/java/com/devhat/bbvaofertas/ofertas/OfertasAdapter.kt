package com.devhat.bbvaofertas.ofertas

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import android.widget.Toast
import androidx.recyclerview.widget.RecyclerView
import com.devhat.bbvaofertas.R

class OfertasAdapter(var list: ArrayList<Ofertas>): RecyclerView.Adapter<OfertasAdapter.ViewHolder>(){

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view){
        fun bindItems(data: Ofertas){
            val text_tienda : TextView = itemView.findViewById(R.id.textOfertasTienda)
            val text_promocion : TextView = itemView.findViewById(R.id.textOfertasPromocion)
            val text_vigencia : TextView = itemView.findViewById(R.id.textOfertasVigencia)
            val imgOfertas : ImageView = itemView.findViewById(R.id.imgOfertasImagen)
            val imgState : ImageView = itemView.findViewById(R.id.imgOfertasState)

            text_tienda.text = data.tienda
            text_promocion.text = data.promocion
            text_vigencia.text = data.vigencia
            imgOfertas.setImageResource(data.imagen)
            imgState.setImageResource(R.drawable.bookmark_select)

            itemView.setOnClickListener{

            }
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val v = LayoutInflater.from(parent?.context).inflate(R.layout.item_ofertas, parent,false)
        return  ViewHolder(v)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        holder.bindItems(list[position])
    }

    override fun getItemCount(): Int {
        return list.size
    }
}