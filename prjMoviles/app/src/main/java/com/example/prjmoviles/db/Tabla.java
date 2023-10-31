package com.example.prjmoviles.db;

public class Tabla {
    public String name ="";
    public String type ="";
    public boolean primary = false;
    public int index = 0;

    public Tabla (String _name, String _type, int _index, Boolean _primary){
        this.name=_name;
        this.type=_type;
        this.primary=_primary;
        this.index=_index;
    }
}
