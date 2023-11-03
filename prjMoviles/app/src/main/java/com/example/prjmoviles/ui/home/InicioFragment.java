package com.example.prjmoviles.ui.home;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.ViewFlipper;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.ViewModelProvider;

import com.example.prjmoviles.R;
import com.example.prjmoviles.databinding.FragmentInicioBinding;
import com.example.prjmoviles.db.BorboDataBase;

public class InicioFragment extends Fragment {

    private FragmentInicioBinding binding;
    ViewFlipper v_flipper;
    TextView bienvenida;
    private int currentIndex = 0;
    private Handler handler = new Handler();
    public void initComponents(View view){
        v_flipper = view.findViewById(R.id.v_flipper);
        bienvenida = view.findViewById(R.id.textView7);
    }
    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {
        InicioViewModel homeViewModel =
                new ViewModelProvider(this).get(InicioViewModel.class);

        binding = FragmentInicioBinding.inflate(inflater, container, false);
        View root = binding.getRoot();

        initComponents(root);
        int images[]={R.drawable.tenis1,R.drawable.tenis2,R.drawable.tenis3,R.drawable.tenis4};
        for(int image: images){
            CarruselImagenes(image);

        }

        String name="";
        BorboDataBase borbo = new BorboDataBase(this.getContext());
        SQLiteDatabase db = borbo.getReadableDatabase();

        String[] columnas = {"usuarioNombre"};
        Cursor user = db.query("usuario", columnas,null, null,null,null,null);

        user.moveToFirst();
        name= user.getString(0);
        user.close();

        String[] words = {"Hola", name, "Bienvenido"};

        bienvenida.setText(words[currentIndex]);

        final Animation fadeOut = new AlphaAnimation(1.0f, 0.0f);
        fadeOut.setDuration(1000);
        final Animation fadeIn = new AlphaAnimation(0.0f, 1.0f);
        fadeIn.setDuration(1000);
        handler.postDelayed(new Runnable() {
            @Override
            public void run() {
                bienvenida.startAnimation(fadeOut);
                currentIndex = (currentIndex + 1) % words.length;
                bienvenida.setText(words[currentIndex]);
                bienvenida.startAnimation(fadeIn);
                handler.postDelayed(this, 2000);
            }
        }, 2000);

        return root;
    }


    private void CarruselImagenes(int image) {
        ImageView imageView = new ImageView(this.getContext());
        imageView.setBackgroundResource(image);
        v_flipper.addView(imageView);
        v_flipper.setFlipInterval(2000);
        v_flipper.setAutoStart(true);
        v_flipper.setInAnimation(this.getContext(), android.R.anim.slide_in_left);
        v_flipper.setOutAnimation(this.getContext(), android.R.anim.slide_out_right);
        try {

        } catch (Exception e) {

        }
    }
    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }
}