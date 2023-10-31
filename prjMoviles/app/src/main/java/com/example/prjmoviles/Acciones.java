package com.example.prjmoviles;

import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.view.Menu;
import android.widget.TextView;

import com.example.prjmoviles.db.BorboDataBase;
import com.example.prjmoviles.db.Usuario;
import com.google.android.material.button.MaterialButton;
import com.google.android.material.snackbar.Snackbar;
import com.google.android.material.navigation.NavigationView;

import androidx.navigation.NavController;
import androidx.navigation.Navigation;
import androidx.navigation.ui.AppBarConfiguration;
import androidx.navigation.ui.NavigationUI;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.appcompat.app.AppCompatActivity;

import com.example.prjmoviles.databinding.ActivityAccionesBinding;

public class Acciones extends AppCompatActivity {

    MaterialButton btnLogOut;
    TextView nameUser;
    private AppBarConfiguration mAppBarConfiguration;
    private ActivityAccionesBinding binding;

    @SuppressLint("WrongViewCast")
    public void initComponents() {
        btnLogOut = findViewById(R.id.btnLogOutA);
        nameUser = findViewById(R.id.txtnameU);
        btnLogOut.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new AlertDialog.Builder(view.getContext())
                        .setTitle("¿Deseas continuar?")
                        .setMessage("¿Seguro que quieres salir de miho?")
                        .setCancelable(false)
                        .setPositiveButton("SALIR", new DialogInterface.OnClickListener() {

                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                borrarTablaUsers();
                            }
                        })
                        .setNegativeButton("CANCELAR", new DialogInterface.OnClickListener() {

                            @Override
                            public void onClick(DialogInterface dialog, int which) {

                                dialog.dismiss();

                            }

                        }).create().show();

            }
        });

    }
    public void pantalla(){
        final Acciones acciones = this;

        //generamos un intent para navegar a la siguiente activity
        Intent intent = new Intent(acciones, MainActivity.class);
        startActivity(intent);
        finish();

    }
    public void borrarTablaUsers(){
     Usuario userC = new Usuario(Acciones.this);
     userC.borrarUsuario(Acciones.this);
        pantalla();
    //    SalidasFragment.salidasArrayList.clear();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = ActivityAccionesBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());
        setSupportActionBar(binding.appBarAcciones.toolbar);
        binding.appBarAcciones.fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });
        DrawerLayout drawer = binding.drawerLayout;
        NavigationView navigationView = binding.navView;
        // Passing each menu ID as a set of Ids because each
        // menu should be considered as top level destinations.
        mAppBarConfiguration = new AppBarConfiguration.Builder(
                R.id.nav_inicio, R.id.nav_productos, R.id.nav_HistorialCompras)
                .setOpenableLayout(drawer)
                .build();
        NavController navController = Navigation.findNavController(this, R.id.nav_host_fragment_content_acciones);
        NavigationUI.setupActionBarWithNavController(this, navController, mAppBarConfiguration);
        NavigationUI.setupWithNavController(navigationView, navController);
        initComponents();

        String name="";
        BorboDataBase borbo = new BorboDataBase(this);
        SQLiteDatabase db = borbo.getReadableDatabase();

        String[] columnas = {"usuarioNombre"};
        Cursor user = db.query("usuario", columnas,null, null,null,null,null);

        user.moveToFirst();
        name= user.getString(0);
        user.close();
        nameUser.setText(name);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.acciones, menu);
        return true;
    }

    @Override
    public boolean onSupportNavigateUp() {
        NavController navController = Navigation.findNavController(this, R.id.nav_host_fragment_content_acciones);
        return NavigationUI.navigateUp(navController, mAppBarConfiguration)
                || super.onSupportNavigateUp();
    }


}