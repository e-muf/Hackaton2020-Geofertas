package com.devhat.bbvaofertas.ui.main

import android.content.Context
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.FragmentPagerAdapter

import com.devhat.bbvaofertas.R

private val TAB_TITLES = arrayOf(
    R.string.tab_text_1,
    R.string.tab_text_2,
    R.string.tab_text_3
)
class SectionsPagerAdapter(private val context: Context, fm: FragmentManager): FragmentPagerAdapter(fm)  {

    override fun getItem(position: Int): Fragment {
        when (position) {
            0 -> return PagInicio()
            1 -> return Mapa()
            2 -> return Extras()
            else -> {
                return PagInicio()
            }
        }
        return PagInicio()
    }
    override fun getPageTitle(position: Int): CharSequence? {
        return context.resources.getString(TAB_TITLES[position])
    }
    override fun getCount(): Int {
        return 3
    }
}