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
import android.widget.Toast
import com.devhat.bbvaofertas.ui.main.SectionsPagerAdapter

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val sectionsPagerAdapter = SectionsPagerAdapter(this, supportFragmentManager)
        val viewPager: ViewPager = findViewById(R.id.view_pager)
        viewPager.adapter = sectionsPagerAdapter
        val tabs: TabLayout = findViewById(R.id.tabs)
        tabs.setupWithViewPager(viewPager)
        val fab: FloatingActionButton = findViewById(R.id.fab)

        fab.setOnClickListener { view ->
            /*
            Algo que haga el botón flotante
             */
            /*
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
}