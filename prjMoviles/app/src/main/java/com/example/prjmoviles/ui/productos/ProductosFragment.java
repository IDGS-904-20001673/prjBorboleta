package com.example.prjmoviles.ui.productos;

import android.app.ProgressDialog;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.widget.Toolbar;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.Volley;
import com.example.prjmoviles.R;
import com.example.prjmoviles.utils.Constants;
import com.example.prjmoviles.constantes.UI;
import com.example.prjmoviles.databinding.FragmentProductosBinding;
import com.example.prjmoviles.model.producto;
import com.example.prjmoviles.utils.ApiBodyService;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class ProductosFragment extends Fragment {

    private FragmentProductosBinding binding;
    AdapterProductos ap;
    RecyclerView rclcvProductos;
    List<producto> listproductos;
    Toolbar toolbar;
    ProgressDialog progressDialog;

    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {

        binding = FragmentProductosBinding.inflate(inflater, container, false);
        View root = binding.getRoot();
        initComponents(root);
        productos();
        return root;
    }
    public void initComponents(View view){
        rclcvProductos = view.findViewById(R.id.rclvPro);
        rclcvProductos.setLayoutManager(new LinearLayoutManager(view.getContext()));
       // toolbar=view.findViewById(R.id.toolbar_detalle);
    }

    private void productos() {
        progressDialog = UI.createProgressDialog(ProductosFragment.this.getContext(),"Consultando los productos","Cargando.....");
        progressDialog.setCancelable(false);
        progressDialog.show();
        JSONObject jsonBody = new JSONObject();
        try {
            RequestQueue requestQueue = Volley.newRequestQueue(getContext());
            ApiBodyService apiBodyService = new ApiBodyService(Request.Method.POST, Constants.productos, jsonBody.toString(), this.RequestSuccessListener(), this.RequestErrorListener());
            requestQueue.add(apiBodyService);
        } catch (Exception e) {

        }
    }



    private Response.Listener<JSONArray> RequestSuccessListener() {
        return new Response.Listener<JSONArray>() {
            @Override
            public void onResponse(JSONArray response) {
                progressDialog.dismiss();
                listproductos = new ArrayList<>();

                try {

                    if (response.length() > 0) {
                        Toast.makeText(ProductosFragment.this.getContext(), "chido", Toast.LENGTH_SHORT).show();
                        for (int i = 0; i < response.length(); i++) {
                            producto pro = new producto();
                            JSONObject jsonObject = response.getJSONObject(i);

                            pro.setId(jsonObject.getInt("idProducto"));
                            pro.setNombre(jsonObject.getString("nombre"));
                            pro.setPrecio(jsonObject.getDouble("precio"));
                            pro.setDescripcion(jsonObject.getString("descripccion"));
                            pro.setImagen(jsonObject.getString("image_name"));

                            listproductos.add(pro);
                        }
                        ap = new AdapterProductos(ProductosFragment.this.getContext(), listproductos);
                        rclcvProductos.setAdapter(ap);

                    } else {
                        Toast.makeText(ProductosFragment.this.getContext(), "No tienes red", Toast.LENGTH_SHORT).show();
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
                Context context = getContext();
                Toast.makeText(context, error.toString(), Toast.LENGTH_LONG).show();
            }
        };
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }

}
