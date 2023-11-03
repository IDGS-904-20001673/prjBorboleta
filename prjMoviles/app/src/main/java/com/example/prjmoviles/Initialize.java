package com.example.prjmoviles;

import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.example.prjmoviles.db.BorboDataBase;

import java.util.Timer;
import java.util.TimerTask;

public class Initialize extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_initialize);


        BorboDataBase borbo = new BorboDataBase(Initialize.this);
        SQLiteDatabase db = borbo.getWritableDatabase();

        Cursor user = db.rawQuery("SELECT * FROM usuario", null);

        if(!user.moveToFirst()){
            pantalla();
        }else{
            pantalla2();
        }

        if (db == null)
            Toast.makeText(this, "Hay un error con la base de datos local, ponte en contacto con un tecnico", Toast.LENGTH_SHORT).show();




    }

    public void pantalla(){
        final Initialize initialize = this;
        TimerTask tarea = new TimerTask() {
            @Override
            public void run() {
                //generamos un intent para navegar a la siguiente activity
                Intent intent = new Intent(initialize, MainActivity.class);
                //cargamos el activity main
                startActivity(intent);
                finish();
            }
        };
        Timer tiempo = new Timer();
        tiempo.schedule(tarea, 1500);

    }
    public void pantalla2(){
        final Initialize initialize = this;
        TimerTask tarea = new TimerTask() {
            @Override
            public void run() {
                //generamos un intent para navegar a la siguiente activity
                Intent intent = new Intent(initialize, Acciones.class);
                //cargamos el activity main
                startActivity(intent);
                finish();
            }
        };
        Timer tiempo = new Timer();
        tiempo.schedule(tarea, 1500);

    }

}