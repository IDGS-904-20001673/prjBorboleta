package com.example.prjmoviles.db;


import android.content.ContentValues;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.provider.BaseColumns;

import com.example.prjmoviles.model.UsuarioModelo;
import static com.example.prjmoviles.constantes.Constants.*;

import java.util.ArrayList;

public class Usuario {
    public static final String TABLE_NAME = "usuario";
    public static ArrayList<Tabla> columnas = new ArrayList<>();
    Context context;

    public Usuario(Context context) {
        super();
        columnas.add(new Tabla(BaseColumns._ID, INT_TYPE,0, true));
        columnas.add(new Tabla("usuario_id", INT_TYPE,1, false));
        columnas.add(new Tabla("usuarioNombre", STRING_TYPE,2, false));
        columnas.add(new Tabla("contrasena", STRING_TYPE,3, false));
    }
    protected static String CREATE_Table_USUARIO(){
        String datos = "";
      for(int i = 0; i<columnas.size(); i++) {
            datos = datos + columnas.get(i).name+" "  ;
            datos = datos + columnas.get(i).type+", " ;
          if(columnas.get(i).primary == true){
              String sub = datos;
              sub = sub.substring(0, (sub.length()-2));
             datos = sub + " PRIMARY KEY AUTOINCREMENT, ";
          } }
        String sub = "";
        sub = datos.substring(0, (datos.length()-2));
        return "CREATE TABLE " + Usuario.TABLE_NAME + "(" + sub.toString() +")";
    }

    public long insertUsuario(int idU, String nameUser, String contra, Context context) {
        long id = 0;
        try {
            BorboDataBase mihoDB = new BorboDataBase(context);
            SQLiteDatabase db = mihoDB.getWritableDatabase();

            ContentValues values = new ContentValues();
            values.put("usuario_id", idU);
            values.put("usuarioNombre", nameUser);
            values.put("contrasena", contra);

            id = db.insert(TABLE_NAME, null, values);

        }catch (Exception e){
          e.toString();
        }
        return id;
    }

    public void borrarUsuario(Context context){
        BorboDataBase miho = new BorboDataBase(context);
        SQLiteDatabase db = miho.getWritableDatabase();
        db.delete("usuario", null, null);
        db.close();
    }

}
