package com.devhat.bbvaofertas

import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import androidx.viewpager2.adapter.FragmentStateAdapter
import com.devhat.bbvaofertas.ui.main.Mapa

class ViewPageAdapter (fragment: FragmentActivity) : FragmentStateAdapter(fragment) {

    override fun getItemCount(): Int = 3

    override fun createFragment(position: Int): Fragment {
        return when(position){
            0 -> {return  Home()}
            1 -> {return Mapa()
            }
            2 -> {return NotificationsFragment()}
            else -> {Fragment()}
        }

    }


}