import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DescripcionProveedoresComponent } from '../descripcion-proveedores/descripcion-proveedores.component';

describe('DescripcionProveedoresComponent', () => {
  let component: DescripcionProveedoresComponent;
  let fixture: ComponentFixture<DescripcionProveedoresComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [DescripcionProveedoresComponent]
    });
    fixture = TestBed.createComponent(DescripcionProveedoresComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
