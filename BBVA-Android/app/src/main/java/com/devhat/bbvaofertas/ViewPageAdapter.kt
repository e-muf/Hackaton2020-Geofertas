package com.devhat.bbvaofertas

import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import androidx.viewpager2.adapter.FragmentStateAdapter

class ViewPageAdapter (fragment: FragmentActivity) : FragmentStateAdapter(fragment) {

    override fun getItemCount(): Int = 3

    override fun createFragment(position: Int): Fragment {
        return when(position){
            0 -> {return  Home()}
            1 -> {return MapsFragment()}
            2 -> {return NotificationsFragment()}
            else -> {Fragment()}
        }

    }


}