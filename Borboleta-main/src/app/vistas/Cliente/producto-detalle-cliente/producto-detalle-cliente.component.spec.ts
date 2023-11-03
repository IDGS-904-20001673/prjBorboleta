import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProductoDetalleClienteComponent } from './producto-detalle-cliente.component';

describe('ProductoDetalleClienteComponent', () => {
  let component: ProductoDetalleClienteComponent;
  let fixture: ComponentFixture<ProductoDetalleClienteComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ProductoDetalleClienteComponent]
    });
    fixture = TestBed.createComponent(ProductoDetalleClienteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
