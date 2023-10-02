package com.example.prjmoviles.constantes;

import android.app.ProgressDialog;
import android.content.Context;

public class UI {
    public static ProgressDialog createProgressDialog(Context context, String title, String message){
        ProgressDialog progressDialog = new ProgressDialog(context);
        progressDialog.setTitle(title);
        progressDialog.setMessage(message);
        progressDialog.setCanceledOnTouchOutside(false);

        return progressDialog;
    }
}
