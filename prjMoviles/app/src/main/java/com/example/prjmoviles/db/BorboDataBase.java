package com.example.prjmoviles.db;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class BorboDataBase extends SQLiteOpenHelper {
    private static final int DATABASE_VERSION = 1;
    private static final String DATABASE_NOMBRE = "borboleta.db";
    Context context ;

    public BorboDataBase(Context context) {
        super(context, DATABASE_NOMBRE, null, DATABASE_VERSION) ;
        this.context = context;
    }

    @Override
    public void onCreate(SQLiteDatabase db) {

        Usuario usuario = new Usuario(context.getApplicationContext());
        db.execSQL(usuario.CREATE_Table_USUARIO());

    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        DropTables(db);
        onCreate(db);
    }

    @Override
    public void onDowngrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        onUpgrade(db, oldVersion, newVersion);
    }

    public void DropTables(SQLiteDatabase db) {
        db.execSQL("DROP TABLE IF EXISTS " + Usuario.TABLE_NAME);
     }

}
