package com.example.prjmoviles;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

import static com.android.volley.Request.Method.POST;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;
import org.json.JSONException;
import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.app.DownloadManager;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.provider.Contacts;
import android.provider.SyncStateContract;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.Volley;

import com.example.prjmoviles.constantes.UI;
import com.example.prjmoviles.model.UsuarioModelo;
import com.example.prjmoviles.utils.ApiBodyService;
import com.example.prjmoviles.utils.Constants;
import com.example.prjmoviles.utils.ResponseSessionModel;
import com.google.android.material.button.MaterialButton;
import com.google.android.material.floatingactionbutton.ExtendedFloatingActionButton;
import com.google.android.material.snackbar.Snackbar;
import com.google.android.material.textfield.TextInputEditText;
import com.google.android.material.textfield.TextInputLayout;
import com.google.gson.Gson;

import org.json.JSONArray;
import org.json.JSONObject;




public class MainActivity extends AppCompatActivity {

    TextInputEditText txtUserSession;
    TextInputEditText txtPasswordSession;
    MaterialButton btnLogin;
    TextInputLayout password;
    TextInputLayout user;
    ProgressDialog progressDialog;
    View view;

    public void initComponents(){
        view = findViewById(android.R.id.content);
        txtUserSession = findViewById(com.example.prjmoviles.R.id.txtUser);
        txtPasswordSession= findViewById(R.id.txtPassword);
        btnLogin = findViewById(R.id.btnLogin);
        password = findViewById(R.id.passEdit);
        user = findViewById(R.id.userEdit);

        btnLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(txtPasswordSession.getText().length() == 0 && txtUserSession.getText().length() == 0) {
                    password.setError("Este campo esta vacio") ;
                    user.setError("Este campo esta vacio");
                }else if(txtPasswordSession.getText().length() == 0) {
                    password.setError("Este campo esta vacio");
                }else if (txtUserSession.getText().length() == 0) {
                    user.setError("Este campo esta vacio");
                }else {
                    iniciarSesion(txtUserSession.getText().toString(), txtPasswordSession.getText().toString());
                }
            }
        });
    }

    @SuppressLint("ResourceType")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setTheme(R.style.MIHO);
        setContentView(R.layout.activity_main);
        getSupportActionBar().hide();
        initComponents();
    }

    private void iniciarSesion(String Usuario, String Password) {
        //Creamos el dialog
        progressDialog = UI.createProgressDialog(this,"Consultando Accesos","Cargando.....");
        progressDialog.setCancelable(false);
        progressDialog.show();
        JSONObject jsonBody = new JSONObject();
        try {
            jsonBody.put("email", Usuario);
            jsonBody.put("password", Password);

            RequestQueue requestQueue = Volley.newRequestQueue(this);
            ApiBodyService apiBodyService = new ApiBodyService(Request.Method.POST, Constants.login, jsonBody.toString(), this.RequestSuccessListener(), this.RequestErrorListener());
            requestQueue.add(apiBodyService);
        } catch (JSONException e) {
            progressDialog.dismiss();
            Snackbar.make(view, e.getMessage(), Snackbar.LENGTH_LONG).show();
            Log.e("MiApp", e.getMessage());
        }
    }

   public void pantalla(){
     final MainActivity mainActivity = this;
     Intent intent = new Intent(mainActivity, Acciones.class);
     startActivity(intent);
     finish();
   }

    private Response.Listener<JSONArray> RequestSuccessListener() {
        return new Response.Listener<JSONArray>() {
            @Override
            public void onResponse(JSONArray response) {
                progressDialog.dismiss();

                try {
                    if (response.length() > 0) {
                        Toast.makeText(MainActivity.this, "chido", Toast.LENGTH_SHORT).show();
                        for (int i = 0; i < response.length(); i++) {
                            JSONObject jsonObject = response.getJSONObject(i);
                            int idUsuario = jsonObject.getInt("idUsuario");
                            String nombre = jsonObject.getString("nombre");
                        }
                        pantalla();
                    } else {
                        password.setError("Contraseña Incorrecta");
                        user.setError("Usuario Incorrecto");
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        };
    }


    private Response.ErrorListener RequestErrorListener() {
        return new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                progressDialog.dismiss();
                Context context = getApplicationContext();
                Toast.makeText(context, error.toString(),Toast.LENGTH_LONG).show();
            }
        };
    }




}