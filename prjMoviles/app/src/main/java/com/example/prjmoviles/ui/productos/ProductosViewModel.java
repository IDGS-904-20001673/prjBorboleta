package com.example.prjmoviles.ui.productos;

import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import com.example.prjmoviles.R;

public class ProductosViewModel extends RecyclerView.ViewHolder {

    protected TextView lblNombre;
    protected TextView lblPrecio;
    protected TextView lblDescripcion;
    protected ImageView imagen;


    public ProductosViewModel(View itemView) {
        super(itemView);

        lblNombre = itemView.findViewById(R.id.lblNombreProducto);
        lblPrecio = itemView.findViewById(R.id.lblPrecio);
        lblDescripcion = itemView.findViewById(R.id.lblDes);
        imagen = itemView.findViewById(R.id.imgProducto);

    }


}