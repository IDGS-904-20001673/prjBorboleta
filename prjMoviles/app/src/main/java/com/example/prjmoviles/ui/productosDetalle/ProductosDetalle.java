package com.example.prjmoviles.ui.productosDetalle;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.ProgressDialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.util.Base64;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageView;
import android.widget.SearchView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.Volley;
import com.example.prjmoviles.R;
import com.example.prjmoviles.constantes.UI;
import com.example.prjmoviles.model.ProductoDetalle;
import com.example.prjmoviles.model.producto;
import com.example.prjmoviles.ui.productos.AdapterProductos;
import com.example.prjmoviles.ui.productos.ProductosFragment;
import com.example.prjmoviles.utils.ApiBodyService;
import com.example.prjmoviles.utils.Constants;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class ProductosDetalle extends AppCompatActivity {

    RecyclerView rclcvProductos;
    ProgressDialog progressDialog;

    List<ProductoDetalle> listproductosDeta;
     TextView lblNombre;
     TextView lblPrecio;
     TextView lblDescripcion;
     ImageView imagen;
    public int id=0;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_productos_detalle);

        initComponents();
        productosDetalle();

    }

    public void initComponents(){
        rclcvProductos = findViewById(R.id.rclvProductoDetalle);
        rclcvProductos.setLayoutManager(new LinearLayoutManager(this));
        lblNombre = findViewById(R.id.txtNombre);
        lblPrecio = findViewById(R.id.txtPrecio);
        imagen = findViewById(R.id.imageProductoDetalle);

        Bundle parametros = this.getIntent().getExtras();
         id = parametros.getInt("idProducto");
        String nombre = parametros.getString("nombre");
        Double precio = parametros.getDouble("precio");
        String image = parametros.getString("image");


        lblNombre.setText(nombre);
        lblPrecio.setText("" +precio);

        String base64Image = image;

        try {
            byte[] imageBytes = Base64.decode(base64Image, Base64.DEFAULT);
            Bitmap bitmap = BitmapFactory.decodeByteArray(imageBytes, 0, imageBytes.length);
            if (bitmap != null) {
                imagen.setImageBitmap(bitmap);
            } else {

                imagen.setImageResource(R.drawable.borbo);
            }
        } catch (Exception e) {
            imagen.setImageResource(R.drawable.borbo);
        }
    }

    public boolean onCreateOptionsMenu(@NonNull Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.acciones, menu);

        super.onCreateOptionsMenu(menu);
        return true;
    }

    private void productosDetalle() {
        progressDialog = UI.createProgressDialog(this,"Consultando el detalle","Cargando.....");
        progressDialog.setCancelable(false);
        progressDialog.show();
        JSONObject jsonBody = new JSONObject();

        try {
            jsonBody.put("idProducto", id);
            RequestQueue requestQueue = Volley.newRequestQueue(this);
            ApiBodyService apiBodyService = new ApiBodyService(Request.Method.POST, Constants.productosDetalle, jsonBody.toString(), this.RequestSuccessListener(), this.RequestErrorListener());
            requestQueue.add(apiBodyService);
        } catch (Exception e) {

        }
    }



    private Response.Listener<JSONArray> RequestSuccessListener() {
        return new Response.Listener<JSONArray>() {
            @Override
            public void onResponse(JSONArray response) {
                progressDialog.dismiss();
                listproductosDeta = new ArrayList<>();
                Context context = getApplicationContext();
                try {

                    if (response.length() > 0) {
                        Toast.makeText(context, "chido", Toast.LENGTH_SHORT).show();
                        for (int i = 0; i < response.length(); i++) {
                            ProductoDetalle pro = new ProductoDetalle();
                            JSONObject jsonObject = response.getJSONObject(i);

                            pro.setId(jsonObject.getInt("idProductoDetalle"));
                            pro.setPunto(jsonObject.getDouble("punto"));


                            listproductosDeta.add(pro);
                        }
                      //  ap = new AdapterProductos(ProductosFragment.this.getContext(), listproductos);
                      //  rclcvProductos.setAdapter(ap);

                    } else {
                        Toast.makeText(context, "No tienes red", Toast.LENGTH_SHORT).show();
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
                Toast.makeText(context, error.toString(), Toast.LENGTH_LONG).show();
            }
        };
    }

}