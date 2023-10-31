package com.example.prjmoviles.ui.productos;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Base64;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Context;

import com.example.prjmoviles.R;
import com.example.prjmoviles.model.producto;
import com.example.prjmoviles.ui.productosDetalle.ProductosDetalle;

import java.util.ArrayList;
import java.util.List;

public class AdapterProductos extends RecyclerView.Adapter<ProductosViewModel> {

    Context context;

    List<producto> productos;

    public AdapterProductos(Context context, List<producto> productos) {
        this.context = context;
        this.productos = productos;

    }
    @NonNull
    @Override
    public ProductosViewModel onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        // cargamos el layout con el diseño de como queremos que se vea cada mercancia:
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.row_producto, parent, false);
        // creamos el viewHolder
        ProductosViewModel PVM = new ProductosViewModel(v);
        // devolvemos el view holder que acabamos de crear
        return PVM;
    }

    @Override
    public void onBindViewHolder(@NonNull ProductosViewModel holder, int position) {
        producto p = productos.get(position);

        holder.lblNombre.setText("Articulo: " + p.getNombre());
        holder.lblPrecio.setText("Precio: " + p.getPrecio());
        holder.lblDescripcion.setText("Descripcion: " + p.getDescripcion());


        String base64Image = p.getImagen();

        try {
            byte[] imageBytes = Base64.decode(base64Image, Base64.DEFAULT);
            Bitmap bitmap = BitmapFactory.decodeByteArray(imageBytes, 0, imageBytes.length);
            if (bitmap != null) {
                holder.imagen.setImageBitmap(bitmap);
            } else {

                holder.imagen.setImageResource(R.drawable.borbo);
            }
        } catch (Exception e) {
            holder.imagen.setImageResource(R.drawable.borbo);
        }

        holder.itemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                Intent intent = new Intent(view.getContext(), ProductosDetalle.class);
                intent.putExtra("idProducto", p.getId());
                intent.putExtra("nombre", p.getNombre());
                intent.putExtra("precio", p.getPrecio());
                intent.putExtra("image", p.getImagen());
                view.getContext().startActivity(intent);

            }
        });
    }

    @Override
    public int getItemCount() {
        return productos.size();
    }
}
