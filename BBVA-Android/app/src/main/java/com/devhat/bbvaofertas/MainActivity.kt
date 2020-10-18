package com.devhat.bbvaofertas

import android.content.ActivityNotFoundException
import android.content.Intent
import android.os.Bundle
import com.google.android.material.floatingactionbutton.FloatingActionButton
import com.google.android.material.snackbar.Snackbar
import com.google.android.material.tabs.TabLayout
import androidx.viewpager.widget.ViewPager
import androidx.appcompat.app.AppCompatActivity
import android.view.Menu
import android.view.MenuItem
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.widget.Toolbar
import androidx.core.content.ContextCompat
import com.devhat.bbvaofertas.ui.main.SectionsPagerAdapter
import com.google.android.material.badge.BadgeDrawable
import com.google.android.material.tabs.TabLayoutMediator
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.fragment_main.*

class MainActivity : AppCompatActivity() {

    private val adapter by lazy { ViewPageAdapter(this) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        //setSupportActionBar(findViewById(R.id.toolbar))

        pager.adapter = adapter
        val tabLayoutMediator = TabLayoutMediator(tabs, pager,
            TabLayoutMediator.TabConfigurationStrategy{tab, position ->
                when(position) {
                    0 -> {
                        tab.setIcon(R.drawable.home)
                    }
                    1 -> {
                        tab.setIcon(R.drawable.location)
                    }
                    2 -> {
                        tab.setIcon(R.drawable.notifications)
                        //val badge: BadgeDrawable= tab.orCreateBadge
                        //badge.backgroundColor = ContextCompat.getColor(applicationContext, R.color.colorAccent)
                        //badge.isVisible = true
                        //badge.number = 10
                    }
                }
            })
        tabLayoutMediator.attach()

        /*
        val sectionsPagerAdapter = SectionsPagerAdapter(this, supportFragmentManager)
        val viewPager: ViewPager = findViewById(R.id.view_pager)
        viewPager.adapter = sectionsPagerAdapter
        val tabs: TabLayout = findViewById(R.id.tabs)
        tabs.setupWithViewPager(viewPager)
        val fab: FloatingActionButton = findViewById(R.id.fab)

        fab.setOnClickListener { view ->

            val i = Intent(Intent.ACTION_SEND)
            i.type = "message/rfc822"
            i.putExtra(Intent.EXTRA_EMAIL, arrayOf("samuelarturo@icloud.com","samuelgarrido.proteco@gmail.com"))
            i.putExtra(Intent.EXTRA_SUBJECT, "Problema con los datos de la aplicación - SSA")
            try {
                startActivity(Intent.createChooser(i, "Email para notificar problemas"))
            } catch (ex: ActivityNotFoundException) {
                Toast.makeText(
                    this,
                    "No hay aplicaciones de correo instaladas en el dispositivo",
                    Toast.LENGTH_SHORT
                ).show()
            }

            */

    }
}